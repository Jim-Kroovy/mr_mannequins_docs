---
title: Import Mr Mannequins FBX
parent: Importing
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/importing/import_mr_mannequins_fbx/
---

# Import Mr Mannequins FBX

**Mr Mannequins FBX** (`mmt.import`) imports compatible FBX files, merging repeated skeletons and optionally retargeting the result onto an existing armature. It's at `File > Import > Mr Mannequins FBX (.fbx)` and in F3 Operator Search. Pick one or more `.fbx` files, set the panels and confirm. The Advanced panel is collapsed by default. There's no `poll()` check, but Blender's FBX importer add-on has to be available, since the import calls `import_scene.fbx`.

{% include media/youtube.html title="Importing two FBX files with Mr Mannequins FBX so their matching skeletons merge into one armature, then importing an animation file onto an existing Target" %}

Imported meshes are renamed after their file, with object and mesh data names kept matching. Armatures are named `<file>_Skeleton`, and new actions are named after the file. Armatures from different files that have the same bone names, hierarchy and root relative rest poses are merged: the first one is kept and later files add their meshes and actions to it. A root bone named after the imported armature object is added when no bone has that name, and parentless bones are parented to it. Object level animation is moved onto that root bone and scaled, and all transforms and parenting are cleared and applied.

Every action gets stashed, and an armature with skeletal meshes finishes at rest with no active action. Imported empties are removed, and duplicate materials and images with numbered names are switched onto the ones already in the file. The imported objects stay selected, and the previous mode is restored when it can be. Custom properties and animation are always imported.

With a **Target**, a file with skeletal meshes and **Meshes** on is posed into the target's bone directions, then that pose is baked into its meshes and rest pose, carrying its stashed actions through. An animation only file with **Actions** on has its actions retargeted onto the highest tier of the target's hierarchy, and the imported skeleton is then removed. **Meshes** only applies to files with skeletal meshes, and **Actions** only applies to files without them. **Orient Armature** only creates an oriented armature inside that mesh path, so it needs a **Target**, **Meshes** on and skeletal meshes in the file.

**Decimate Keyframes** set to **Before** runs ahead of scaling and retargeting, and **After** runs last, on wherever the actions ended up. **Key Thinning** runs alongside **After** when that's chosen, otherwise before retargeting, and it works with **Decimate Keyframes** on None. Decimating can be slow, around several seconds per action on a dense baked mocap take.

**Root Length** is shown but the import never reads it. An added root bone's length comes from **Max Length** multiplied by the scene's scale relative to centimetres, or 0.1 when **Max Length** is 0. The panel settings are remembered between imports and sessions, including when an import fails, and are reset when the add-on version changes. A `RuntimeError` during import reports the error and cancels, restoring the mode, selection and active object.

- **Orientation > Orient Armature** (`orient`) — Checkbox; default Off. Create an oriented armature for any armatures that get imported.
- **Orientation > Root Length** (`root_length`) — Float; default 0.1; min 0, max 1000. Length to give the root bone added to imported armatures, 0 to disable adding one.
- **Orientation > Max Length** (`max_length`) — Float; default 0.1; min 0. Clamp oriented armature bones down to this length if they would otherwise be longer. 0 to disable. Available when Orient Armature is on.
- **Orientation > Original Shape** (`original_shape`) — Choice; default first item (None); dynamic list. Custom shape for the original armatures bones. Available when Orient Armature is on.
- **Orientation > Oriented Shape** (`oriented_shape`) — Choice; default first item (None); dynamic list. Custom shape for the oriented armatures bones. Available when Orient Armature is on.
- **Retargeting > Target** (`target`) — Choice; default None; dynamic list. Optional existing armature to retarget imported meshes and actions onto.
- **Retargeting > Meshes** (`meshes`) — Checkbox; default On. Retarget imported meshes onto the target armature. Available when Target isn't None.
- **Retargeting > Actions** (`actions`) — Checkbox; default On. Retarget imported actions onto the target or oriented armature. Available when Target isn't None.
- **Retargeting > Step Height** (`step_height`) — Float; default 0.1; min 0. How far a plantigrade foot's heel needs to lift before its parent fully hands the ball's own hinge rotation over to the foot control. Available when Actions is on and Target isn't None.
- **Cleaning > Remove Leaf Bones** (`leaf_bones`) — Checkbox; default On. Remove bones that deform nothing themselves but are parented to a bone that does, catching leaf bones the FBX importers own Ignore Leaf Bones setting misses. Only acts on armatures with skeletal meshes.
- **Cleaning > Decimate Keyframes** (`decimate`) — Choice; default None. Reduce each imported actions keyframes via blenders own curve-fitting decimate. This can be slow - expect several seconds per action on a dense, fully baked mocap take.
  - **None**: Don't decimate keyframes. (Faster, but less editable)
  - **Before**: Decimate before scaling and retargeting. (Slow but more editable)
  - **After**: Decimate after scaling and retargeting (Slower but more editable and more accurate)
- **Cleaning > Error Margin** (`margin`) — Float; default 0.01; min 0. How much the decimated curve is allowed to deviate from the original. Available when Decimate Keyframes isn't None.
- **Cleaning > Key Thinning** (`spacing`) — Integer; default 0; min 0. Minimum space keys can have when thinning. (0 to disable).
- **Advanced > Manual Orientation** (`manual_orientation`) — Checkbox; default Off. Specify orientation and scale, instead of using embedded data in the FBX file.
- **Advanced > Scale** (`scaling`) — Float; default 1; min 0.001, max 1000. Scale all data. Available when Manual Orientation is on.
- **Advanced > Forward** (`forward`) — Choice; default -X Forward; options **X Forward**, **Y Forward**, **Z Forward**, **-X Forward**, **-Y Forward**, **-Z Forward**. Forward axis. Available when Manual Orientation is on.
- **Advanced > Up** (`upward`) — Choice; default Y Up; options **X Up**, **Y Up**, **Z Up**, **-X Up**, **-Y Up**, **-Z Up**. Up axis. Available when Manual Orientation is on.
- **Advanced > Custom Normals** (`use_custom_normals`) — Checkbox; default On. Import custom normals, if available (otherwise Blender computes them).
- **Advanced > Image Search** (`use_image_search`) — Checkbox; default On. Search subdirectories for any associated images (WARNING: may be slow).
- **Advanced > Alpha Decals** (`use_alpha_decals`) — Checkbox; default Off. Treat materials with alpha as decals (no shadow casting).
- **Advanced > Decal Offset** (`decal_offset`) — Float; default 0; min 0, max 1. Displace geometry of alpha meshes. Available when Alpha Decals is on.
- **Advanced > Animation Offset** (`anim_offset`) — Float; default 1; unbounded. Offset to apply to animation during import, in frames.
- **Advanced > Ignore Leaf Bones** (`ignore_leaf_bones`) — Checkbox; default Off. Ignore the last bone at the end of each chain (used to mark the length of the previous bone).
- **Advanced > Force Connect Children** (`force_connect_children`) — Checkbox; default Off. Force connection of children bones to their parent, even if their computed head/tail is not aligned (technically, it works only if the distance between both is small).
- **Advanced > Automatic Bone Orientation** (`automatic_bone_orientation`) — Checkbox; default Off. Try to align the major bone axis with the bone children.
- **Advanced > Primary Bone Axis** (`primary`) — Choice; default Y Axis; options **X Axis**, **Y Axis**, **Z Axis**, **-X Axis**, **-Y Axis**, **-Z Axis**. Primary bone axis. Available when Automatic Bone Orientation is off.
- **Advanced > Secondary Bone Axis** (`secondary`) — Choice; default X Axis; options **X Axis**, **Y Axis**, **Z Axis**, **-X Axis**, **-Y Axis**, **-Z Axis**. Secondary bone axis. Available when Automatic Bone Orientation is off.
- **Advanced > Use Pre/Post Rotation** (`use_prepost_rot`) — Checkbox; default On. Use pre/post rotation from FBX transform (you may have to disable it for some armatures, when it causes them to be twisted).
