---
title: Edit Existing Animation
parent: Ultimate Workflows
nav_order: 2
permalink: /ultimate_workflows/edit_existing_animation/
---

# Edit Existing Animation

Import existing animation FBX files from any source, edit them with Mr Mannequins Tools and export the results. You can then take those exports wherever they're needed, including Unreal Engine.

Your skeleton doesn't need to be compatible with anything to import it. Compatibility only matters if you choose the optional Target route.

If you're importing skeletal meshes or a custom character, follow [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %}) instead.

## Video

{% include media/youtube.html title="The full Edit Existing Animation workflow: importing an animation FBX, creating the Oriented armature, editing an action in Pose mode, exporting it and optionally importing it onto a matching skeleton in Unreal Engine" %}

## 1A. Import without a Target

*(Use this when compatibility is unknown, or you just want to edit the animation. This is the safe route.)*

1. Open `File > Import > Mr Mannequins FBX (.fbx)`. See [Import Mr Mannequins FBX]({% link docs/all_the_tools/importing/import_mr_mannequins_fbx.md %}).
2. Select one or more files. Files with the same bone names, hierarchy and rest poses are merged onto one armature.
3. Leave **Target** in the Retargeting panel on None.
4. Optional: set **Decimate Keyframes** in the Cleaning panel if you want fewer keys to edit. It's None by default and can be slow on dense animation.
5. Confirm the import.

You get one armature named `<file>_Skeleton` for each different skeleton, with an action named after each file, stashed in the NLA. Carry on from step 2.

{% include media/screenshot.html alt="Blender file browser in File > Import > Mr Mannequins FBX with two animation FBX files selected and the Retargeting panel open, Target set to None" %}

## 1B. Optional: import directly onto a compatible Target

*(Use this when you already know the skeleton is compatible with an armature in the file.)*

This replaces step 1A. A compatible armature could be a previously configured custom character or a mannequin template. Retargeting matches bones by name and through any bone mappings, and bones that don't match don't get keyed. It also works relative to rest poses, so the file's rest pose has to match the Target's. If you don't know, use step 1A.

The Target has to be in the file before you import. It can be an armature from an earlier import, or one added from `Add > Template` with [Load Template]({% link docs/all_the_tools/templates/template.md %}).

1. Open `File > Import > Mr Mannequins FBX (.fbx)` and select your files.
2. Set **Target** in the Retargeting panel to the receiving armature.
3. Leave **Actions** on.
4. Optional: set **Decimate Keyframes** in the Cleaning panel. **After** runs on the retargeted result, and **Before** runs ahead of retargeting so there's less to process.
5. Confirm the import.

The actions land on the highest tier of the Target's hierarchy and get stashed there under their file names, and the imported skeleton is removed. The last imported action is left active on that armature. If the Target already has an Oriented armature, skip step 2 and go straight to step 3 using that armature.

If that hierarchy has a Rigging armature, the actions get baked onto its rigging, so working with them is outside this guide. See [Rapid Rigging]({% link docs/rapid_rigging/index.md %}).

If the Target has no Oriented armature, run step 2 on it before editing.

**Adding more animations later:** to import more animation files for a character you've already set up, pick its existing armature as the **Target**. Importing without a Target creates a separate `<file>_Skeleton` armature and doesn't merge into the existing one, because files only merge within a single import. Using a compatible Target avoids those extra armatures.

{% include media/screenshot.html alt="Blender file browser in File > Import > Mr Mannequins FBX with the Retargeting panel open, a Target armature picked, Actions on, and the Cleaning panel showing Decimate Keyframes set to After" %}

## 2. Create the Oriented armature

Armatures imported from FBX keep the source skeleton's bone directions and rolls. This step builds a second armature with matching bone names whose bones are oriented for Blender, using shortest rolls.

You only need this step when the armature doesn't already have an Oriented armature. That's always the case after step 1A, because importing animation without a Target doesn't create one. It prepares the armature for editing, rigging and retargeting, and rigging tools and bone mappings aren't available without one.

If it already has one, skip to step 3 and use it. The button in the steps below reads **Update Oriented Armature** in that case, instead of **Create Oriented Armature**.

It isn't a general requirement for exporting. The export can also run on an imported armature that has no Oriented armature.

1. Select the imported armature so it's active.
2. In `Properties > Armature > Orientation`, press **Create Oriented Armature**. In Pose mode you can also use `Pose > Apply > Create Oriented Armature`. See [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}).
3. In the redo panel, leave **Retarget Actions** on. This is what moves your actions across.
4. Select the Oriented armature and make it active before carrying on. The Original is left active after creation, and your actions aren't on it any more.

The result is a pair of armatures:

- **Oriented** (`<name>_Oriented`): the one you edit. It holds the stashed actions and sits at the top of the pair.
- **Original** (`<name>_Original`): the imported skeleton, shown as a wireframe and parented to the Oriented armature. Its bones are constrained to follow the matching Oriented bones, and it no longer holds any actions.

Both armatures finish at rest with no active action. **Max Length** only affects the Oriented armature's bones. The Original keeps the skeleton's own bones, and that's the armature that gets exported.

{% include media/screenshot.html alt="Properties editor Armature tab with the Orientation panel and Create Oriented Armature button, beside a 3D Viewport showing the Oriented armature with the wireframe Original overlaid" %}

## 3. Pick an action to edit

The add-on doesn't have an operator for picking an action, so use Blender's Action Editor. Once an action is active, the add-on's action tools in step 4 work on it.

1. Select the Oriented armature so it's active, then enter Pose mode. After a Target import nothing is left selected or active.
2. Open a Dope Sheet in **Action Editor** mode.
3. Pick the imported action from the action selector. Stashed actions are in the NLA as muted, locked tracks, and they're also listed here.
4. If the action doesn't play, check that Blender has assigned it an action slot.

{% include media/screenshot.html alt="3D Viewport in Pose mode on the Oriented armature, beside a Dope Sheet in Action Editor mode with an imported action picked from the action selector" %}

## 4. Edit the animation

1. Pose bones on the Oriented armature, and key them with Blender's usual tools.
2. Edit timing and values in the Dope Sheet or Graph Editor.
3. Scrub the timeline to check the Original wireframe is following your edits.
4. Repeat from step 3 for any other actions. They all stay on the same armature.

Retargeted actions key bones in quaternion rotation, so edit those channels rather than adding Euler keys.

These add-on tools are optional:

- [Decimate Keyframes]({% link docs/all_the_tools/retargeting/decimate_keyframes.md %}): reduces dense keys on the selected f-curves.
- [Split Active Action]({% link docs/all_the_tools/keyframing/split_active_action.md %}): cuts an action into new stashed actions by frame range.
- [Add Oscillatory Motion]({% link docs/all_the_tools/keyframing/add_oscillatory_motion.md %}): layers looping offsets onto the selected bones of the active action.
- [Transfer Root Motion]({% link docs/all_the_tools/keyframing/transfer_root_motion.md %}): moves a source bone's travel along a world direction onto a target such as the root.
- [Redirect Root Motion]({% link docs/all_the_tools/keyframing/redirect_root_motion.md %}): creates actions with root motion redirected around a chosen world axis.

Edits go straight into the action you picked, and that same action is what the stash points to. There's no separate apply or transfer step. The export bakes it across to the Original in step 5.

To keep your untouched source animation in Blender, duplicate the action first and edit the copy. A new action isn't in the stash, so stash it with the Action Editor or choose a different **Method** in step 5.

## 5. Export

1. Select the Oriented armature, in any mode. **Only Selected** is on by default, and selecting either armature in the pair finds the same export.
2. Open `File > Export > Mr Mannequins FBX (.fbx)`. See [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %}).
3. Pick a folder in the file browser. The file name you type is ignored, because names come from the actions.
4. In the Actions panel, leave **Export** on and set **Method**:
   - **Only Stashed** is the default, and exports everything in the stash. This includes every action edited in place.
   - **Only Active** exports just the action currently assigned.
   - **All Actions** exports every action that animates the armature's bones.
5. Leave **Batch Export** on for one FBX per action. Off merges them into one file as separate animation stacks.
6. Optional: turn off **Export** in the Meshes panel, since this guide only exports actions.
7. Leave the Advanced panel on its defaults unless you have a reason to change it. **Background Export** should stay on.
8. Confirm the export.

Each action is baked from the Oriented armature onto the Original, one key per frame across the action's frame range, then written to FBX. The Original's bones are what end up in the file. Without a Target that's the skeleton you imported, and with a Target it's the Target's skeleton. Actions imported from `Walk.fbx` export as `Walk.fbx`, so choose a different folder or rename the action if you don't want to overwrite your source file. A name Blender has suffixed exports with an underscore, so `Walk.001` writes `Walk_001.fbx`.

{% include media/screenshot.html alt="Blender file browser in File > Export > Mr Mannequins FBX with the Actions panel set to Only Stashed and Batch Export on, and Export off in the Meshes panel" %}

## 6. Optional: import into Unreal Engine

This step only applies if Unreal Engine is where the animation is going.

1. Import the exported FBX into your Unreal Engine project.
2. In the import options, choose the Skeleton asset that matches the exported skeleton.
3. Open the imported animation to check it.

Import option names and other settings can vary, so check them in your version of Unreal Engine.

{% include media/screenshot.html alt="Unreal Engine import options for the exported FBX, with the matching Skeleton asset selected" %}

## Limitations

- **Keep the skeleton intact.** Don't rename, add or remove bones on the Original if the animation has to go back onto the same skeleton. The export writes whatever bones the Original has.
- **Decimated keys don't survive export.** The export bakes every frame, so decimating only helps while you edit. **Simplify** in the Advanced panel controls reduction in the FBX itself.
- **Everything on the Original gets baked.** Exported motion is the evaluated result of the Original's constraints, so bones it can't follow won't export as you posed them.
- **The root bone can be added on import.** If no bone is named after the imported armature object, a root bone with that name is added, and object level animation moves onto it. At export the armature is temporarily renamed `Armature` to stop an extra root bone being written.
- **Turning off Background Export changes your open file.** Only do it for debugging.
- **Animation Offset moves your timing.** It defaults to 1 frame on import, and batched exports keep the action's frame range. A file starting on frame 0 exports starting on frame 1, with the same motion one frame later, and each further import and export adds another frame. Set it to 0 in the Advanced panel on import to keep the source frames.
- **Older exports can store the wrong rest pose.** Animation exported before Mr Mannequins Tools 5.0.22 can store a posed rest pose, so it can import wrong onto a Target and may not merge with other files. Export it again from 5.0.22 or later, or import it without a Target.

## Related

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %}): preparing custom characters, including those with existing armatures and actions.
- [Rapid Rigging]({% link docs/rapid_rigging/index.md %}): creating and configuring modular animation rigs. Start with [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}).
- Transfer Root Motion (planned guide): transferring motion between the pelvis and root bones. See the [Transfer Root Motion]({% link docs/all_the_tools/keyframing/transfer_root_motion.md %}) operator.
- Redirect Root Motion (planned guide): changing movement direction to create alternative animations. See the [Redirect Root Motion]({% link docs/all_the_tools/keyframing/redirect_root_motion.md %}) operator.
- Animation Retargeting (planned guide): transferring animations between different armatures. See the [Retarget Actions]({% link docs/all_the_tools/retargeting/retarget.md %}) operator.

### Related Operators

- [Import Mr Mannequins FBX]({% link docs/all_the_tools/importing/import_mr_mannequins_fbx.md %})
- [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %})
- [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %})
