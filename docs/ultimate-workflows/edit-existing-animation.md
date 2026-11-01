---
title: Edit Existing Animation
parent: Ultimate Workflows
nav_order: 2
permalink: /ultimate-workflows/edit-existing-animation/
---

# Edit Existing Animation

Import an existing Unreal Engine animation into Blender, edit it, and export it back to Unreal Engine on the same skeleton.

If your character comes with its own actions, follow Setup Custom Character instead (planned guide).

## Requirements

- Mr Mannequins Tools enabled in Blender.
- One or more animation FBX files exported from Unreal Engine. All of the steps below assume these files have no skeletal mesh in them.
- The Skeleton asset those animations use, still in your Unreal Engine project.

## Procedure

There are two ways in. Follow one of them, then carry on from step 3.

| Route | Use it when | Steps |
| ----- | ----------- | ----- |
| Without a Target | You just want to edit the animation, or you have nothing in the file to retarget onto. | 1A, then 2 |
| With a Target | The file already has a compatible armature that should receive the actions. | 1B |

### 1A. Import without a Target

1. Open `File > Import > Mr Mannequins FBX (.fbx)`. See [Import Mr Mannequins FBX]({% link docs/all-the-tools/importing/import-mr-mannequins-fbx.md %}).
2. Select one or more files. Files with matching skeletons are merged onto one armature.
3. Leave **Target** in the Retargeting panel on None.
4. Optional: set **Decimate Keyframes** in the Cleaning panel if you want fewer keys to edit. It's off by default and can be slow on dense animation.
5. Confirm the import.

You get one armature named `<file>_Skeleton`, with an action named after each file, stashed in the NLA.

{% include media/screenshot.html alt="Blender file browser in File > Import > Mr Mannequins FBX with two animation FBX files selected and the Retargeting panel open, Target set to None" %}

### 1B. Import directly onto a compatible Target

This replaces steps 1A and 2. Only use it when you know the two skeletons are compatible, because retargeting matches bones by name and through any bone mappings. Bones that don't match don't get keyed.

The Target has to be in the file before you import. It can be an armature from an earlier import, or one added from `Add > Template` with [Template]({% link docs/all-the-tools/templates/template.md %}).

1. Open `File > Import > Mr Mannequins FBX (.fbx)` and select your files.
2. Set **Target** in the Retargeting panel to the receiving armature.
3. Leave **Actions** on. **Meshes** doesn't affect animation only files.
4. Optional: set **Decimate Keyframes** in the Cleaning panel. **After** runs on the retargeted result, and **Before** runs ahead of retargeting so there's less to process.
5. Confirm the import.

The actions land on the highest tier of the Target's hierarchy and get stashed there under their file names, and the imported skeleton is removed. If the Target has an Oriented armature, skip to step 3 and work on that.

If that hierarchy has a Rigging armature, the actions get baked onto its rigging, so working with them is outside this guide. See Rapid Rigging (planned guide).

If the Target only has an Original armature, or is an untagged one, run step 2 on it before editing.

{% include media/screenshot.html alt="Blender file browser in File > Import > Mr Mannequins FBX with the Retargeting panel open, a Target armature picked, Actions on, and the Cleaning panel showing Decimate Keyframes set to After" %}

### 2. Create the Oriented armature

Armatures imported from FBX keep the source skeleton's bone directions and rolls. This step builds a second armature with matching bone names whose bones are oriented for Blender, using shortest rolls.

This step is required for this workflow when you import without a compatible Target. It gives you a compatible armature for editing, and for any rigging and retargeting you do afterwards. Rigging tools and bone mappings aren't available without one.

It isn't a general requirement for exporting. The export can also run on an imported armature that has no Oriented armature.

1. Select the imported armature so it's active.
2. In `Properties > Armature > Orientation`, press **Create Oriented Armature**. In Pose mode you can also use `Pose > Apply > Create Oriented Armature`. See [Set Oriented Armature]({% link docs/all-the-tools/orientation/set-oriented-armature.md %}).
3. In the redo panel, leave **Retarget Actions** on. This is what moves your actions across.
4. Select the Oriented armature and make it active before carrying on. The Original is left active after creation, and your actions aren't on it any more.

The result is a pair of armatures:

| Armature | Name | Role |
| -------- | ---- | ---- |
| Oriented | `<name>_Oriented` | The one you edit. It holds the stashed actions and sits at the top of the pair. |
| Original | `<name>_Original` | The imported skeleton, shown as a wireframe and parented to the Oriented armature. Its bones are constrained to follow the matching Oriented bones, and it no longer holds any actions. |

Both armatures finish at rest with no active action. **Max Length** only affects the Oriented armature's bones. The Original keeps the skeleton's own bones, and that's the armature that gets exported.

{% include media/screenshot.html alt="Properties editor Armature tab with the Orientation panel and Create Oriented Armature button, beside a 3D Viewport showing the Oriented armature with the wireframe Original overlaid" %}

### 3. Pick an action to edit

The add-on doesn't have an operator for picking an action, so use Blender's Action Editor. Once an action is active, the add-on's action tools in step 4 work on it.

1. With the Oriented armature active, enter Pose mode.
2. Open a Dope Sheet in **Action Editor** mode.
3. Pick the imported action from the action selector. Stashed actions are in the NLA as muted, locked tracks, and they're also listed here.
4. If the action doesn't play, check that Blender has assigned it an action slot.

{% include media/screenshot.html alt="3D Viewport in Pose mode on the Oriented armature, beside a Dope Sheet in Action Editor mode with an imported action picked from the action selector" %}

### 4. Edit the animation

1. Pose bones on the Oriented armature, and key them with Blender's usual tools.
2. Edit timing and values in the Dope Sheet or Graph Editor.
3. Scrub the timeline to check the Original wireframe is following your edits.
4. Repeat from step 3 for any other actions. They all stay on the same armature.

Retargeted actions key bones in quaternion rotation, so edit those channels rather than adding Euler keys.

These add-on tools are optional:

| Tool | Use it to |
| ---- | --------- |
| [Decimate Keyframes]({% link docs/all-the-tools/retargeting/decimate-keyframes.md %}) | Reduce dense keys on the selected f-curves. |
| [Split Active Action]({% link docs/all-the-tools/keyframing/split-active-action.md %}) | Cut an action into new stashed actions by frame range. |
| [Add Oscillatory Motion]({% link docs/all-the-tools/keyframing/add-oscillatory-motion.md %}) | Layer looping offsets onto the selected bones of the active action. |
| [Refresh Binding Constraints]({% link docs/all-the-tools/rigging/refresh-binding-constraints.md %}) | Refresh the Original's constraints if it stops following the Oriented armature properly. |

Edits go straight into the action you picked, and that same action is what the stash points to. There's no separate apply or transfer step. The export bakes it across to the Original in step 5.

To keep your untouched source animation in Blender, duplicate the action first and edit the copy. A new action isn't in the stash, so stash it with the Action Editor or choose a different **Method** in step 5.

### 5. Export

1. Select the Oriented armature, in any mode. **Only Selected** is on by default, and selecting either armature in the pair finds the same export.
2. Open `File > Export > Mr Mannequins FBX (.fbx)`. See [Export Mr Mannequins FBX]({% link docs/all-the-tools/exporting/export-mr-mannequins-fbx.md %}).
3. Pick a folder in the file browser. The file name you type is ignored, because names come from the actions.
4. In the Actions panel, leave **Export** on and set **Method**:
   - **Only Stashed** is the default, and exports everything in the stash. This includes every action edited in place.
   - **Only Active** exports just the action currently assigned.
   - **All Actions** exports every action that animates the armature's bones.
5. Leave **Batch Export** on for one FBX per action. Off merges them into one file as separate animation stacks.
6. Optional: turn off **Export** in the Meshes panel. This guide only imported animation, so with just the armature selected there are no meshes to write anyway.
7. Leave the Advanced panel on its defaults unless you have a reason to change it. **Background Export** should stay on.
8. Confirm the export.

Each action is baked from the Oriented armature onto the Original, one key per frame across the action's frame range, then written to FBX. The Original's bones are what end up in the file, so the skeleton matches what you imported. Actions imported from `Walk.fbx` export as `Walk.fbx`, so choose a different folder or rename the action if you don't want to overwrite your source file.

{% include media/screenshot.html alt="Blender file browser in File > Export > Mr Mannequins FBX with the Actions panel set to Only Stashed and Batch Export on, and Export off in the Meshes panel" %}

### 6. Import back into Unreal Engine

1. Import the exported FBX into your Unreal Engine project.
2. In the import options, choose the original Skeleton asset the animation came from.
3. Open the imported animation to check it.

Import option names and other settings can vary, so check them in your version of Unreal Engine.

{% include media/screenshot.html alt="Unreal Engine import options for the exported FBX, with the original Skeleton asset selected" %}

## Video

{% include media/youtube.html title="The full Edit Existing Animation workflow: importing an Unreal Engine animation FBX, creating the Oriented armature, editing an action in Pose mode, exporting it and importing it back onto its skeleton in Unreal Engine" %}

## Limitations

- **Keep the skeleton intact.** Don't rename, add or remove bones on the Original if the animation has to go back onto the same Skeleton asset. The export writes whatever bones the Original has.
- **Decimated keys don't survive export.** The export bakes every frame, so decimating only helps while you edit. **Simplify** in the Advanced panel controls reduction in the FBX itself.
- **Everything on the Original gets baked.** Exported motion is the evaluated result of the Original's constraints, so bones it can't follow won't export as you posed them.
- **The root bone can be added on import.** If no bone is named after the imported armature object, a root bone with that name is added, and object level animation moves onto it. At export the armature is temporarily renamed `Armature` to stop an extra root bone being written.
- **Files with skeletal meshes behave differently.** With a Target they go through the mesh retargeting path instead of the animation path described here, and without one the armature finishes at rest with its actions stashed.
- **Turning off Background Export changes your open file.** Only do it for debugging.
- **Animation Offset defaults to 1 frame on import.** It's in the Advanced panel.

## Related

### Related Workflows

- Setup Custom Character (planned guide): preparing custom characters, including those with existing armatures and actions.
- Rapid Rigging (planned guides): creating and configuring modular animation rigs. Start with [Add Rigging Module]({% link docs/all-the-tools/rigging/add-rigging-module.md %}).
- Transfer Root Motion (planned guide): transferring motion between the pelvis and root bones. See the [Transfer Root Motion]({% link docs/all-the-tools/keyframing/transfer-root-motion.md %}) operator.
- Redirect Root Motion (planned guide): changing movement direction to create alternative animations. See the [Redirect Root Motion]({% link docs/all-the-tools/keyframing/redirect-root-motion.md %}) operator.
- Animation Retargeting (planned guide): transferring animations between different armatures. See the [Retarget]({% link docs/all-the-tools/retargeting/retarget.md %}) operator.

### Related Operators

- [Import Mr Mannequins FBX]({% link docs/all-the-tools/importing/import-mr-mannequins-fbx.md %})
- [Set Oriented Armature]({% link docs/all-the-tools/orientation/set-oriented-armature.md %})
- [Export Mr Mannequins FBX]({% link docs/all-the-tools/exporting/export-mr-mannequins-fbx.md %})
