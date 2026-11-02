---
title: Retargeting Armatures
parent: Ultimate Workflows
nav_order: 3
permalink: /ultimate_workflows/retargeting_armatures/
---

# Retargeting Armatures

Permanently adapt one character to another character's bone names, directions and hierarchy, carry its animation across, optionally rebuild the same rigging on it, then export the result.

Four armatures are involved:

- **Original:** your character's mesh deforming skeleton, and the one that gets exported. Apply changes its rest pose, its bones and its meshes.
- **Oriented:** your character's editable layer, oriented for Blender. Set runs from here, and Apply rebuilds it and carries its stored actions across.
- **Target:** a separate reference character that you're matching. Posing works against its Oriented armature, or its Original if it has no Oriented, and never against its Rigging.
- **Rigging:** optional controls above a character. The Target's Rigging is only where Copy Rigging reads its modules from, and your character gets its own rebuilt separately.

Your character needs its Oriented armature before you start. The Target can get through Set and Apply Retarget Pose on its Original alone, but it needs an Oriented armature to hold mapping rows. [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %}) covers creating one, in its steps 1 and 2.

Do this before adding any rigging to your character. Apply doesn't rebuild an existing Rigging armature, so don't count on one still working afterwards.

## Video

{% include media/youtube.html title="The full Retargeting Armatures workflow: mapping Target bones, setting and cleaning up the retarget pose, applying it with Enforce Hierarchy, pasting the Target's rigging, retargeting the carried actions onto the new controls, exporting and optionally importing into Unreal Engine" %}

## 1. Configure Bone Mapping

You only need this for bones with different names. A bone with the same name on both armatures already matches.

1. Make the Target armature active and enter Pose mode.
2. Make a Target bone active.
3. Open `3D Viewport > Sidebar > Item > Retargeting` or `Properties > Bone > Retargeting`.
4. Press **+** on the Bone Mapping row. See [Add Mapping]({% link docs/all_the_tools/retargeting/add_mapping.md %}).
5. Type the name of your character's bone that corresponds to this Target bone.
6. Repeat for every bone that needs one. To remove a row, use the **X** beside it. See [Remove Mapping]({% link docs/all_the_tools/retargeting/remove_mapping.md %}).

An exact name always wins. Otherwise the rows are tried in order, and the first name your character actually has is used. Empty rows do nothing. A mapping edited on one tier is copied to the bones with the same name on the Target's Original, Oriented and Rigging armatures.

**Mirror Settings** and **Copy To Children** only copy the Rotation and Translation settings, not mapping rows. The left and right sides each need their own rows.

**Rotation** and **Translation** don't affect the steps that follow, since Set Retarget Pose only uses bone correspondence and directions. They apply when actions get retargeted.

{% include media/screenshot.html alt="3D Viewport in Pose mode on the Target armature, with the Sidebar Item tab showing the Retargeting panel and a Bone Mapping row holding the matching bone name from the other character" %}

## 2. Set Retarget Pose

1. Make your character's Oriented armature active.
2. Open `Pose > Apply > Set Retarget Pose`. See [Retarget Pose]({% link docs/all_the_tools/retargeting/retarget_pose.md %}).
3. Set **Target** in the redo panel. It resets to None each time you run this from the menu, and nothing happens until you pick one.
4. Leave **Only Selected** off to pose every matched bone. On only poses the selected ones, and the unselected bones just follow their parents.

Matched bones are posed in hierarchy order towards the Target's bone directions and twist. Your character keeps its own proportions and bone lengths. Nothing is renamed or baked yet, and the rest pose and actions aren't changed.

Now check the result, since Apply bakes whatever you leave here:

1. Look at the meshes, which follow through the Original.
2. Compare the joint axes, silhouette, hands, feet, root, pelvis and extremities against the Target.
3. Correct any unwanted rotation or translation by posing the Oriented armature by hand.

{% include media/screenshot.html alt="3D Viewport in Pose mode with the character's Oriented armature and deformed meshes posed beside the Target, and the Retarget Pose redo panel showing Target and Only Selected" %}

## 3. Apply Retarget Pose

1. Open `Pose > Apply > Apply Retarget Pose`, with the Oriented armature still active. It runs straight away using the last **Target**, so check that's the right one in the redo panel.
2. Adjust these in the redo panel:
   - **Max Length** clamps longer bones to this length. 0 turns it off.
   - **Rename Bones** renames your matched bones to the Target's names.
   - **Enforce Hierarchy** adds bones the Target has between two of your matched bones.

This is what Apply does:

- The current pose is baked into the meshes and becomes the Original's rest pose, and its binding constraints are cleared.
- Matched bones take the Target's directions and rolls but keep their own lengths.
- The Oriented armature is rebuilt with the same name, and its active and stashed actions are rebased onto the new rest pose and stashed on it.
- Socket meshes are converted to skeletal meshes.

**Enforce Hierarchy** has limits. It only fills a gap where the Target has extra bones between a matched bone and its matched parent, and it doesn't copy every Target bone you don't have. An injected bone gets:

- The Target bone's name, whichever way **Rename Bones** is set.
- A position proportional along your own bone gap, and the Target bone's direction.
- A share of the vertex weight from the bones either side of it, shared out by how close each vertex is. That isn't a general weight clean up.
- A share of the rotation from the bone that used to carry it, in your existing actions.

Inspect every injected chain, and fix its deformation and vertex groups by hand where you need to. [Weight Meshes]({% link docs/all_the_tools/skinning/weight_meshes.md %}) can help with repairs.

**Rename Bones** only covers bones with a match. Bones only your character has keep their names, and Target branches outside those gaps aren't created. Check the Original's final names and hierarchy yourself.

{% include media/screenshot.html alt="3D Viewport after Apply Retarget Pose with the redo panel showing Max Length, Rename Bones and Enforce Hierarchy, and an injected bone chain selected in the Outliner" %}

## 4. Optional: Copy Rigging

This needs a Target with a Rigging armature. Modules find their bones by name, so this works best with **Rename Bones** on in step 3. See [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %}).

1. Make any armature in the Target's hierarchy active.
2. In `Properties > Armature > Rigging Modules`, open the down arrow menu and choose **Copy Rigging**.
3. Make your character's Oriented armature active, in Object or Pose mode.
4. Open the same menu and choose **Paste Rigging**.

The modules' types and settings are rebuilt on your character, and a Rigging armature is created if it doesn't have one. Mirrored modules are built again from their primary rather than being copied. Pasting adds to any modules already there. Optional roles your character doesn't have are cleared, and a module missing a bone it requires is removed, with a warning listing what couldn't be pasted.

Check the module settings, controls, mirrored sides, shared bones and IK/FK behavior on the result. Other module options will be covered by the Rapid Rigging guides (planned).

If your character has actions, retarget them onto the new controls now. They're still on the Oriented armature, and with Rigging above it the export won't find them there.

1. Make your character's Rigging armature active, in Pose mode.
2. Open `Pose > Apply > Retarget Actions From`. See [Retarget]({% link docs/all_the_tools/retargeting/retarget.md %}).
3. In the redo panel, set **Target** to your character's own Oriented armature.
4. Leave **Only Selected** off and **Keep Original** on.

{% include media/screenshot.html alt="Properties editor Rigging Modules panel with the down arrow menu open on Paste Rigging, beside a 3D Viewport showing the pasted controls on the retargeted character" %}

## 5. Export Character

Before you export, check the rest pose, the complete bone list and parent hierarchy, the mesh deformation, vertex groups, action ranges and names, and some representative motion.

1. Select the character's skeletal meshes. **Only Selected** is on by default, and selecting only an armature doesn't export its meshes.
2. Open `File > Export > Mr Mannequins FBX (.fbx)`. See [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %}).
3. Pick a folder in the file browser. The file name you type is ignored, because names come from the meshes and actions.
4. Set the Meshes and Actions panels. **Only Stashed** is the default **Method**, and it includes the actions from steps 3 and 4.
5. Leave **Background Export** on in the Advanced panel, so your open file isn't changed.
6. Confirm the export.

The Original is written as the skeleton. Actions come from the highest tier, baked down onto the Original: that's Rigging after step 4, otherwise Oriented. With **Keep Original** on in step 4, the action names carry the Original's name as a prefix into their file names.

Whether this goes back onto the Target's skeleton depends on the Original's final names and hierarchy, and on the destination's own rules. **Rename Bones** and **Enforce Hierarchy** bring the two closer together, but they don't guarantee it, especially when either skeleton has extra branches the other doesn't.

{% include media/screenshot.html alt="Blender file browser in File > Export > Mr Mannequins FBX with the Meshes and Actions panels open, and the retargeted character's skeletal meshes selected in the scene" %}

## 6. Optional: Import into Unreal Engine

This step only applies if Unreal Engine is where the character is going.

1. Import the exported FBX into your Unreal Engine project.
2. In the import options, only choose an existing Skeleton asset if it matches the exported skeleton. Choosing one can't repair an incompatible hierarchy.
3. Check the mesh deformation, reference pose, bone tree, animation playback, root motion, scale and axes.

Import option names and other settings can vary, so check them in your version of Unreal Engine.

{% include media/screenshot.html alt="Unreal Engine Skeleton editor showing the imported character's bone tree and reference pose, beside its skeletal mesh import options with the matching Skeleton asset selected" %}

## Limitations

- **Compatibility isn't automatic.** Padding, renaming, automatic weights and picking a Skeleton in Unreal Engine don't prove the character is compatible with anything. Check the results.
- **Apply is a permanent change.** It changes the rest pose and bakes the meshes, so save a copy first if you might need the old character.
- **An existing Rigging armature isn't rebuilt.** Apply leaves it out of date, which is why this comes before rigging.
- **Injected weights are only a starting point.** Meshes converted from sockets during Apply get them too, but check every injected chain by hand.

## Related

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %}): importing a character, creating its Oriented armature and rigging it.
- [Edit Existing Animation]({% link docs/ultimate_workflows/edit_existing_animation.md %}): importing, editing and exporting animation files.
- Rapid Rigging (planned guides): creating and configuring modular animation rigs.

### Related Operators

- [Add Mapping]({% link docs/all_the_tools/retargeting/add_mapping.md %})
- [Remove Mapping]({% link docs/all_the_tools/retargeting/remove_mapping.md %})
- [Retarget Pose]({% link docs/all_the_tools/retargeting/retarget_pose.md %})
- [Weight Meshes]({% link docs/all_the_tools/skinning/weight_meshes.md %})
- [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %})
- [Retarget]({% link docs/all_the_tools/retargeting/retarget.md %})
- [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %})
