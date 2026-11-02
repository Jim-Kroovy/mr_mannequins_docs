---
title: Custom Character Setup
parent: Ultimate Workflows
nav_order: 1
permalink: /ultimate_workflows/custom_character_setup/
---

# Custom Character Setup

Import a character FBX, give it an Oriented armature and a modular rig, bring across any animation it came with, then export the result.

Your skeleton doesn't need to be compatible with anything to import it. Compatibility only matters when the export has to go back onto an existing skeleton, which is covered in step 5.

If you only want to edit animation files, follow [Edit Existing Animation]({% link docs/ultimate_workflows/edit_existing_animation.md %}) instead.

## Video

{% include media/youtube.html title="The full Custom Character Setup workflow: importing a character FBX, creating the Oriented armature, adding the Root, Spine, Head, Arm, Leg and Finger modules, retargeting its existing animation onto the rig and exporting the character" %}

## 1. Import Custom Character

1. Open `File > Import > Mr Mannequins FBX (.fbx)`. See [Import Mr Mannequins FBX]({% link docs/all_the_tools/importing/import_mr_mannequins_fbx.md %}).
2. Select one or more character files. Files with the same bone names, hierarchy and root relative rest poses are merged onto one armature.
3. Leave **Target** in the Retargeting panel on None.
4. Leave **Orient Armature** off in the Orientation panel. It only acts when importing meshes onto a Target, and step 2 creates the armature directly.
5. Check the settings that depend on your file:
   - **Remove Leaf Bones** in the Cleaning panel is on by default, and removes bones that deform nothing but are parented to a bone that does.
   - **Decimate Keyframes** in the Cleaning panel is None by default. Set it if the file has animation you want fewer keys on, though it can be slow on dense animation.
   - **Manual Orientation** in the Advanced panel lets you set **Scale**, **Forward** and **Up** yourself, if the file's embedded values don't suit it.
6. Confirm the import.

You get one armature named `<file>_Skeleton` for each different skeleton, with the meshes on it. Any animation in the files is imported too, with each action named after its file and stashed on the armature. It's fine if there isn't any, you just skip step 4 later.

{% include media/screenshot.html alt="Blender file browser in File > Import > Mr Mannequins FBX with a character FBX selected, Target set to None in the Retargeting panel and Orient Armature off in the Orientation panel" %}

## 2. Create Oriented Armature

1. Select the imported armature so it's active.
2. In `Properties > Armature > Orientation`, press **Create Oriented Armature**. In Pose mode you can also use `Pose > Apply > Create Oriented Armature`. See [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}).
3. In the redo panel, leave **Retarget Actions** on.

The result is a pair of armatures:

- **Original** (`<name>_Original`): the imported skeleton. It keeps the source bones that the meshes use and that get exported in the end, and it follows the armatures above it through binding constraints.
- **Oriented** (`<name>_Oriented`): sits above the Original with matching bone names and rolls that suit Blender. Modular rigging and retargeting both work from this one.

Any active and stashed actions are retargeted onto the Oriented armature and stashed there. Socket meshes on the Original are converted to skeletal meshes.

Pressing the button again reads **Update Oriented Armature**, and it works differently. It adds any bones the Original has that the Oriented doesn't, but it doesn't retarget actions or remove Oriented bones the Original no longer has.

{% include media/screenshot.html alt="Properties editor Armature tab with the Orientation panel and Create Oriented Armature button, beside a 3D Viewport showing the Oriented armature with the wireframe Original overlaid" %}

## 3. Rig Custom Character

This step sets up one full biped using [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}). Every other option a module has is covered in [Rapid Rigging]({% link docs/rapid_rigging/index.md %}).

1. Select the Oriented armature so it's active, then enter Pose mode.
2. Select the bones for a module, listed below.
3. Pick the module from `Pose > Add Rigging`, or `Shift + A`. The first one creates `<name>_Rigging` above the Oriented armature.
4. Check its settings in `Properties > Armature > Rigging Modules`.
5. Repeat for the next module. The Rigging armature becomes active after each one, but modules only read Oriented bones, so keep selecting your bones on the Oriented armature.

Add these in order:

- **Root Controls** (Root): make the root bone active. Any other bones you have selected become motion followers, so don't select extras unless you want that.
- **Spline Chain** (Spline Spine): select at least three connected spine bones. The first bone's parent becomes the origin, if it has one. **Count** sets how many targets are spread along the chain, and **Influences** sets how many nearby targets blend together to drive each bone's twist. **Axis** and **Offset** can stay as they are to start with.
- **Curl Chain** (Curl Head): select a separate connected neck and head chain of at least two bones. A character with only one suitable bone here can't use this module this way.
- **Opposable Arm** (Opposable Arms): select at least the upper arm, lower arm and hand. The last bone in the chain is the ending, and the first bone's parent is the origin.
- **Plantigrade Leg** (Plantigrade Legs): select at least the thigh, calf and foot. The foot is the ending, and the required **Pivot** is filled in from the foot's first child, commonly a ball or toe bone. If that's the wrong bone, change **Pivot** in the module's settings.
- **Curl Chain** (Curl Fingers): add one module for each connected finger chain, with at least two bones in each. The first bone's parent becomes the origin.

If you've selected too few bones, or a foot has no child bone to use as the **Pivot**, the module doesn't build and goes back to Empty Module.

**Mirror Rigging** turns itself on when every selected bone has an opposite side bone, found through names like `arm_l` and `arm_r` or `LeftArm` and `RightArm`, and builds the other side for you. An origin with no side in its name, like `pelvis`, is shared by both. If your names don't resolve, add the other side as its own module.

**Edit Shared** decides whether a module can edit and restyle a bone it shares with another module, like an origin. It's on for the first module to claim a bone and off for later ones, so they don't change it.

Don't give the same chain bone to two modules. That isn't a supported setup, and nothing stops you from selecting it, so check your selection. Sharing is only for origins and endings.

{% include media/screenshot.html alt="3D Viewport in Pose mode with the Pose > Add Rigging menu open and the finished Root, Spine, Head, Arm, Leg and Finger controls visible on the character, beside the Rigging Modules panel listing the modules" %}

## 4. Optional: Retarget Existing Animations

Only do this if step 1 imported actions. They're on the Oriented armature now, and they need baking onto the rig so you can animate them with its controls.

1. Make the Rigging armature active, in Pose mode.
2. Open `Pose > Apply > Retarget Actions From`. See [Retarget Actions]({% link docs/all_the_tools/retargeting/retarget.md %}).
3. In the redo panel, set **Target** to this character's own Oriented armature. It's listed even though Rigging is the highest tier. Nothing happens until you pick one.
4. Leave **Only Selected** off for a complete bake.
5. Set **Keep Original**. On keeps the Oriented actions and prefixes the new ones with the Original's name. **Off deletes the source actions** and gives the new ones their names.
6. Adjust **Step Height** if you need to. It controls how far a Plantigrade foot's heel lifts before its ball hinge fully hands over to the foot control.

The new actions land on the Rigging armature. If the Oriented armature had an active action, its result is made active on Rigging, and everything else is stashed. Each bone's retargeting settings and name mappings decide what matches, and an action with no matching bones is skipped.

{% include media/screenshot.html alt="3D Viewport in Pose mode on the Rigging armature with the Retarget Actions redo panel showing the character's Oriented armature as Target, Only Selected off and Keep Original on" %}

## 5. Export Character

1. Select the character's meshes. **Only Selected** is on by default, and selecting a mesh also finds its armature. Selecting only an armature doesn't export its meshes.
2. Open `File > Export > Mr Mannequins FBX (.fbx)`. See [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %}).
3. Pick a folder in the file browser. The file name you type is ignored, because names come from the meshes and actions.
4. In the Meshes panel, leave **Export** on, and turn **Batch Export** off if you want all the meshes in one file.
5. In the Actions panel, leave **Export** on if you did step 4, otherwise turn it off. **Only Stashed** is the default **Method**, and it doesn't include an action that's active but not stashed. Use **All Actions** if you need both.
6. Leave **Background Export** on in the Advanced panel, so your open file isn't changed.
7. Confirm the export.

Actions are found on the highest tier, which is Rigging here, baked down through the hierarchy onto the Original, and written with it. Meshes export skinned to the Original too. With **Keep Original** on in step 4, the action names carry the prefix into their file names.

If the export has to go back onto an existing skeleton, the Original's hierarchy and rest pose have to stay compatible with it, along with your import settings at the destination. Axes, scale and naming all depend on the destination, so check them there. **Scale**, **Forward** and **Up** are in the Advanced panel.

{% include media/screenshot.html alt="Blender file browser in File > Export > Mr Mannequins FBX with the Meshes and Actions panels open, Only Stashed set as the Method, and the character's meshes selected in the scene" %}

## Limitations

- **This is one biped setup.** Other module types and skeletons are covered in [Rapid Rigging]({% link docs/rapid_rigging/index.md %}).
- **Actions only come across once.** They're only retargeted onto the Oriented armature when it's created, so actions added to the Original later don't come across on an update.
- **Don't rename, add or remove bones on the Original** if the export has to go back onto an existing skeleton. The export writes whatever bones the Original has.

## Related

### Related Workflows

- [Edit Existing Animation]({% link docs/ultimate_workflows/edit_existing_animation.md %}): importing, editing and exporting animation files.
- [Rapid Rigging]({% link docs/rapid_rigging/index.md %}): creating and configuring modular animation rigs.

### Related Operators

- [Import Mr Mannequins FBX]({% link docs/all_the_tools/importing/import_mr_mannequins_fbx.md %})
- [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %})
- [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %})
- [Retarget Actions]({% link docs/all_the_tools/retargeting/retarget.md %})
- [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %})
