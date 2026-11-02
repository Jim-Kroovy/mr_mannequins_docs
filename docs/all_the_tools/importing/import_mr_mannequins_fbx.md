---
title: Import Mr Mannequins FBX
parent: Importing
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/importing/import_mr_mannequins_fbx/
---

# Import Mr Mannequins FBX

**Operator:** `mmt.import`  
**Label:** Mr Mannequins FBX

Imports compatible FBX files, merging repeated skeletons and optionally retargeting the result onto an existing armature.

## Location

- `File > Import > Mr Mannequins FBX (.fbx)`
- F3 Operator Search

## Requirements

- No `poll()` check.
- Blender's FBX importer add-on has to be available, since the import calls `import_scene.fbx`.

## Usage

1. Open the operator and pick one or more `.fbx` files.
2. Pick a **Target** in the Retargeting panel if the import should land on an existing armature.
3. Set the Orientation, Cleaning and Advanced panels.
4. Confirm the import.

{% include media/screenshot.html alt="File browser in File > Import > Mr Mannequins FBX, with the Orientation, Retargeting and Cleaning panels expanded and a Target armature picked." %}

## Result

- Imported meshes are renamed after their file, with object and mesh data names kept matching. Armatures are named `<file>_Skeleton`, and new actions are named after the file.
- Armatures from different files that have the same bone names, hierarchy and root relative rest poses are merged. The first one is kept and later files add their meshes and actions to it.
- A root bone named after the imported armature object is added when no bone has that name. Parentless bones are parented to it.
- Object level animation is moved onto that root bone and scaled, and all transforms and parenting are cleared and applied.
- Every action gets stashed. An armature with skeletal meshes finishes at rest with no active action.
- Imported empties are removed, and duplicate materials and images with numbered names are switched onto the ones already in the file.
- The imported objects stay selected, and the previous mode is restored when it can be.

## Properties

### Orientation panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Orient Armature<br>`orient` | Checkbox | Off |  | Create an oriented armature for any armatures that get imported. |
| Root Length<br>`root_length` | Float | 0.1 | Min 0, Max 1000 | Length to give the root bone added to imported armatures, 0 to disable adding one. |
| Max Length<br>`max_length` | Float | 0.1 | Min 0 | Clamp oriented armature bones down to this length if they would otherwise be longer. 0 to disable.<br>*Orient Armature on.* |
| Original Shape<br>`original_shape` | Choice | First item (None) | Dynamic list | Custom shape for the original armatures bones.<br>*Orient Armature on.* |
| Oriented Shape<br>`oriented_shape` | Choice | First item (None) | Dynamic list | Custom shape for the oriented armatures bones.<br>*Orient Armature on.* |

### Retargeting panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Target<br>`target` | Choice | None | Dynamic list | Optional existing armature to retarget imported meshes and actions onto. |
| Meshes<br>`meshes` | Checkbox | On |  | Retarget imported meshes onto the target armature.<br>*Target isn't None.* |
| Actions<br>`actions` | Checkbox | On |  | Retarget imported actions onto the target or oriented armature.<br>*Target isn't None.* |
| Step Height<br>`step_height` | Float | 0.1 | Min 0 | How far a plantigrade foot's heel needs to lift before its parent fully hands the ball's own hinge rotation over to the foot control.<br>*Actions on and Target isn't None.* |

### Cleaning panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Remove Leaf Bones<br>`leaf_bones` | Checkbox | On |  | Remove bones that deform nothing themselves but are parented to a bone that does, catching leaf bones the FBX importers own Ignore Leaf Bones setting misses.<br>*Only acts on armatures with skeletal meshes.* |
| Decimate Keyframes<br>`decimate` | Choice | None | **None**: Don't decimate keyframes. (Faster, but less editable)<br>**Before**: Decimate before scaling and retargeting. (Slow but more editable)<br>**After**: Decimate after scaling and retargeting (Slower but more editable and more accurate) | Reduce each imported actions keyframes via blenders own curve-fitting decimate. This can be slow - expect several seconds per action on a dense, fully baked mocap take. |
| Error Margin<br>`margin` | Float | 0.01 | Min 0 | How much the decimated curve is allowed to deviate from the original.<br>*Decimate Keyframes isn't None.* |
| Key Thinning<br>`spacing` | Integer | 0 | Min 0 | Minimum space keys can have when thinning. (0 to disable). |

### Advanced panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Manual Orientation<br>`manual_orientation` | Checkbox | Off |  | Specify orientation and scale, instead of using embedded data in the FBX file.<br>*Collapsed by default.* |
| Scale<br>`scaling` | Float | 1 | Min 0.001, Max 1000 | Scale all data.<br>*Manual Orientation on.* |
| Forward<br>`forward` | Choice | -X Forward | **X Forward**<br>**Y Forward**<br>**Z Forward**<br>**-X Forward**<br>**-Y Forward**<br>**-Z Forward** | Forward axis.<br>*Manual Orientation on.* |
| Up<br>`upward` | Choice | Y Up | **X Up**<br>**Y Up**<br>**Z Up**<br>**-X Up**<br>**-Y Up**<br>**-Z Up** | Up axis.<br>*Manual Orientation on.* |
| Custom Normals<br>`use_custom_normals` | Checkbox | On |  | Import custom normals, if available (otherwise Blender computes them). |
| Image Search<br>`use_image_search` | Checkbox | On |  | Search subdirectories for any associated images (WARNING: may be slow). |
| Alpha Decals<br>`use_alpha_decals` | Checkbox | Off |  | Treat materials with alpha as decals (no shadow casting). |
| Decal Offset<br>`decal_offset` | Float | 0 | Min 0, Max 1 | Displace geometry of alpha meshes.<br>*Alpha Decals on.* |
| Animation Offset<br>`anim_offset` | Float | 1 | Unbounded | Offset to apply to animation during import, in frames. |
| Ignore Leaf Bones<br>`ignore_leaf_bones` | Checkbox | Off |  | Ignore the last bone at the end of each chain (used to mark the length of the previous bone). |
| Force Connect Children<br>`force_connect_children` | Checkbox | Off |  | Force connection of children bones to their parent, even if their computed head/tail is not aligned (technically, it works only if the distance between both is small). |
| Automatic Bone Orientation<br>`automatic_bone_orientation` | Checkbox | Off |  | Try to align the major bone axis with the bone children. |
| Primary Bone Axis<br>`primary` | Choice | Y Axis | **X Axis**<br>**Y Axis**<br>**Z Axis**<br>**-X Axis**<br>**-Y Axis**<br>**-Z Axis** | Primary bone axis.<br>*Automatic Bone Orientation off.* |
| Secondary Bone Axis<br>`secondary` | Choice | X Axis | **X Axis**<br>**Y Axis**<br>**Z Axis**<br>**-X Axis**<br>**-Y Axis**<br>**-Z Axis** | Secondary bone axis.<br>*Automatic Bone Orientation off.* |
| Use Pre/Post Rotation<br>`use_prepost_rot` | Checkbox | On |  | Use pre/post rotation from FBX transform (you may have to disable it for some armatures, when it causes them to be twisted). |

## Variants

### With a Target

- A file with skeletal meshes and **Meshes** on is posed into the target's bone directions, then that pose is baked into its meshes and rest pose. Its stashed actions are carried through.
- An animation only file with **Actions** on has its actions retargeted onto the highest tier of the target's hierarchy. The imported skeleton is then removed.
- **Meshes** only applies to files with skeletal meshes, and **Actions** only applies to files without them.

### With Orient Armature

- The oriented armature is only created inside the retarget mesh path above, so it needs a **Target**, **Meshes** on and skeletal meshes in the file.

### Decimate Keyframes

- **Before** runs ahead of scaling and retargeting. **After** runs last, on wherever the actions ended up.
- **Key Thinning** runs alongside **After** when that's chosen, and otherwise runs before retargeting. It works with **Decimate Keyframes** on None.

## Limitations

- The panel settings are remembered between imports and sessions, including when an import fails. They're reset when the add-on version changes.
- Custom properties and animation are always imported.
- **Root Length** is shown but the import never reads it. An added root bone's length comes from **Max Length** multiplied by the scene's scale relative to centimetres, or 0.1 when **Max Length** is 0.
- **Decimate Keyframes** can be slow, around several seconds per action on a dense baked mocap take.
- A `RuntimeError` during import reports the error and cancels, restoring the mode, selection and active object.

## Related Operators

- [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %}): The matching FBX export.
- [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}): Creates an oriented armature directly.
- [Retarget Pose]({% link docs/all_the_tools/retargeting/retarget_pose.md %}): The Set and Apply steps that retargeted meshes go through here.
- [Retarget]({% link docs/all_the_tools/retargeting/retarget.md %}): Retargets actions after import instead.
- [Decimate Keyframes]({% link docs/all_the_tools/retargeting/decimate_keyframes.md %}): The same decimate and thinning pass, run by hand.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
