# Operator audit

Maintainer record of which operators are documented under All The Tools, and why. It isn't published.

- Source: `mr_mannequins_tools` working tree at version 5.0.21, Git HEAD `5c1c90f`, including uncommitted changes and the untracked `keyframing` package.
- Audit date: 2026-11-01. RNA values checked in Blender 5.0.0.
- Inclusion rule: registered, not `INTERNAL`, and reachable from a menu, panel, button, shortcut or F3 Operator Search, unless it's listed under Public operators left unpublished.

| Count | |
| ----- | - |
| Discovered operator classes | 31 |
| Registered and public | 30 |
| Published | 29 |
| Public but unpublished | 1 |
| Internal, excluded | 1 |

The baseline count of 31 classes (30 public, 1 internal) still holds, and no operator differs from the baseline list. One of the 30 public operators is deliberately unpublished, see below.

## Included operators

`bl_options` is `{'REGISTER', 'UNDO'}` on all of these, so they're all in F3. Registration is the `register_class` call in the source folder's `__init__.py`.

| Source category | Source file and class | `bl_idname` | Label | Exposure | Decision | Permalink |
| --- | --- | --- | --- | --- | --- | --- |
| Exporting | `exporting/_operators.py` `MMT_OT_ExportingFBX` | `mmt.export` | Mr Mannequins FBX | `File > Export > Mr Mannequins FBX (.fbx)`; F3 Operator Search | Public | `/all_the_tools/exporting/export_mr_mannequins_fbx/` |
| Importing | `importing/_operators.py` `MMT_OT_ImportingFBX` | `mmt.import` | Mr Mannequins FBX | `File > Import > Mr Mannequins FBX (.fbx)`; F3 Operator Search | Public | `/all_the_tools/importing/import_mr_mannequins_fbx/` |
| Keyframing | `keyframing/_operators.py` `MMT_OT_KeyframingOscillation` | `mmt.generate_loops` | Add Oscillatory Motion | `Pose > Apply > Add Oscillatory Motion`; F3 Operator Search | Public | `/all_the_tools/keyframing/add_oscillatory_motion/` |
| Keyframing | `keyframing/_operators.py` `MMT_OT_KeyframingRedirect` | `mmt.redirect_motion` | Redirect Root Motion | `Pose > Apply > Redirect Root Motion`; F3 Operator Search | Public | `/all_the_tools/keyframing/redirect_root_motion/` |
| Keyframing | `keyframing/_operators.py` `MMT_OT_KeyframingSplit` | `mmt.split_action` | Split Active Action | `Pose > Apply > Split Active Action`; F3 Operator Search, which also works in Object mode | Public | `/all_the_tools/keyframing/split_active_action/` |
| Keyframing | `keyframing/_operators.py` `MMT_OT_KeyframingTransfer` | `mmt.transfer_motion` | Transfer Root Motion | `Pose > Apply > Transfer Root Motion`; F3 Operator Search | Public | `/all_the_tools/keyframing/transfer_root_motion/` |
| Orientation | `orientation/_operators.py` `MMT_OT_OrientationBone` | `mmt.orient` | Set Bone Orientation | `Pose > Apply > Set Bone Orientation`; F3 Operator Search, which also works in Edit mode | Public | `/all_the_tools/orientation/set_bone_orientation/` |
| Orientation | `orientation/_operators.py` `MMT_OT_OrientationArmature` | `mmt.oriented` | Set Oriented Armature | `Pose > Apply > Create Oriented Armature` or `Update Oriented Armature`, depending on whether the armature already has an oriented pair; `Properties > Armature > Orientation`, with the same label; F3 Operator Search | Public | `/all_the_tools/orientation/set_oriented_armature/` |
| Retargeting | `retargeting/_operators.py` `MMT_OT_RetargetingAddMapping` | `mmt.add_mapping` | Add Mapping | `3D Viewport > Sidebar > Item > Retargeting`, the **+** on the Bone Mapping row; `Properties > Bone > Retargeting`, the **+** on the Bone Mapping row; F3 Operator Search | Public | `/all_the_tools/retargeting/add_mapping/` |
| Retargeting | `retargeting/_operators.py` `MMT_OT_RetargetingKeyframes` | `mmt.fcurve` | Decimate Keyframes | `Dope Sheet > Key > Decimate Keyframes`; F3 Operator Search | Public | `/all_the_tools/retargeting/decimate_keyframes/` |
| Retargeting | `retargeting/_operators.py` `MMT_OT_RetargetingRemoveMapping` | `mmt.remove_mapping` | Remove Mapping | `3D Viewport > Sidebar > Item > Retargeting`, the **X** on a mapping row; `Properties > Bone > Retargeting`, the **X** on a mapping row; F3 Operator Search | Public | `/all_the_tools/retargeting/remove_mapping/` |
| Retargeting | `retargeting/_operators.py` `MMT_OT_RetargetingActions` | `mmt.actions` | Retarget | `Pose > Apply > Retarget Actions To`; `Pose > Apply > Retarget Actions From`; F3 Operator Search, which uses the From direction | Public | `/all_the_tools/retargeting/retarget/` |
| Retargeting | `retargeting/_operators.py` `MMT_OT_RetargetingPose` | `mmt.pose` | Retarget Pose | `Pose > Apply > Set Retarget Pose`; `Pose > Apply > Apply Retarget Pose`; F3 Operator Search, which uses the Set mode | Public | `/all_the_tools/retargeting/retarget_pose/` |
| Rigging | `rigging/_operators.py` `MMT_OT_RiggingAddModule` | `mmt.add` | Add Rigging Module | `Pose > Add Rigging`, then a module type; `Shift + A` in Pose mode opens the same menu; `Properties > Armature > Rigging Modules`, the **+** button, which adds an empty module; F3 Operator Search, which adds an empty module | Public | `/all_the_tools/rigging/add_rigging_module/` |
| Rigging | `rigging/_operators.py` `MMT_OT_RiggingCopy` | `mmt.copy` | Copy Rigging | `Properties > Armature > Rigging Modules`, the down arrow menu, **Copy Rigging** and **Paste Rigging**; F3 Operator Search, which uses Copy | Public | `/all_the_tools/rigging/copy_rigging/` |
| Rigging | `rigging/_operators.py` `MMT_OT_RiggingShapes` | `mmt.shapes` | Custom Shapes | `Object > Save Custom Shape`; `Object > Load Custom Shape`; F3 Operator Search, which uses the Save mode | Public | `/all_the_tools/rigging/custom_shapes/` |
| Rigging | `rigging/_operators.py` `MMT_OT_RiggingMoveModule` | `mmt.move` | Move Rigging Module | `Properties > Armature > Rigging Modules`, the up and down arrow buttons; F3 Operator Search | Public | `/all_the_tools/rigging/move_rigging_module/` |
| Rigging | `rigging/_operators.py` `MMT_OT_RiggingRebuild` | `mmt.rebuild` | Rebuild Rigging | `Properties > Armature > Rigging Modules`, the down arrow menu, **Rebuild Rigging**; F3 Operator Search | Public | `/all_the_tools/rigging/rebuild_rigging/` |
| Rigging | `rigging/_operators.py` `MMT_OT_RiggingRefresh` | `mmt.refresh` | Refresh Binding Constraints | `Pose > Apply > Refresh Binding Constraints`; F3 Operator Search | Public | `/all_the_tools/rigging/refresh_binding_constraints/` |
| Rigging | `rigging/_operators.py` `MMT_OT_RiggingRemoveModule` | `mmt.remove` | Remove Rigging Module | `Properties > Armature > Rigging Modules`, the **-** button; F3 Operator Search | Public | `/all_the_tools/rigging/remove_rigging_module/` |
| Rigging | `rigging/_operators.py` `MMT_OT_RiggingSnap` | `mmt.snap` | Snap IK to FK | `3D Viewport > Sidebar > Animation > Controls`, **Snap IK to FK** and **Snap FK to IK**; `Properties > Armature > Rigging Modules > Controls`, the same two buttons; F3 Operator Search, which uses IK to FK | Public | `/all_the_tools/rigging/snap_ik_to_fk/` |
| Shaping | `shaping/_operators.py` `MMT_OT_ShapingBlend` | `mmt.blend` | Blend Shape Keys | `Mesh > Vertex > Blend Shape Keys` in Edit mode, greyed out unless the active object is a mesh with shape keys; F3 Operator Search | Public | `/all_the_tools/shaping/blend_shape_keys/` |
| Shaping | `shaping/_operators.py` `MMT_OT_ShapingExtract` | `mmt.extract` | Extract Shape Keys | `Mesh > Vertex > Extract Shape Keys` in Edit mode, greyed out unless the active object is a mesh with shape keys; F3 Operator Search | Public | `/all_the_tools/shaping/extract_shape_keys/` |
| Shaping | `shaping/_operators.py` `MMT_OT_ShapingMirror` | `mmt.mirror` | Mirror Shape Keys | `Mesh > Vertex > Mirror Shape Keys` in Edit mode, greyed out unless the active object is a mesh with shape keys; F3 Operator Search | Public | `/all_the_tools/shaping/mirror_shape_keys/` |
| Skinning | `skinning/_operators.py` `MMT_OT_SkinningSocket` | `mmt.socket` | Socket Meshes | `Object > Apply > Socket Meshes`; `Object > Apply > Unsocket Meshes`; F3 Operator Search, which uses Socket | Public | `/all_the_tools/skinning/socket_meshes/` |
| Skinning | `skinning/_operators.py` `MMT_OT_SkinningWeight` | `mmt.weight` | Weight Meshes | `Weights > Weight Meshes` in Weight Paint mode; F3 Operator Search | Public | `/all_the_tools/skinning/weight_meshes/` |
| Templates | `templates/_operators.py` `MMT_OT_TemplatesLoad` | `mmt.template` | Template | `Add > Template`, then a template, in the 3D Viewport; F3 Operator Search | Public | `/all_the_tools/templates/template/` |
| Utilities | `utilities/_operators.py` `MMT_OT_UtilitiesApply` | `mmt.apply` | Apply Meshes | `Object > Apply > Apply Meshes`; F3 Operator Search | Public | `/all_the_tools/utilities/apply_meshes/` |
| Utilities | `utilities/_operators.py` `MMT_OT_UtilitiesClean` | `mmt.clean` | Clean Meshes | `Object > Apply > Clean Meshes`; F3 Operator Search | Public | `/all_the_tools/utilities/clean_meshes/` |

## Public operators left unpublished

These are still registered and public in the source, but have no page, route or search entry.

| Source file and class | `bl_idname` | Label | Exposure | Decision | Evidence |
| --- | --- | --- | --- | --- | --- |
| `keyframing/_operators.py` `MMT_OT_KeyframingLocomotion` | `mmt.generate_locomotion` | Generate Locomotion | **F3 Operator Search** only. It isn't in a menu or panel. | Unpublished | Jim's release decision on 2026-11-02: it isn't ready for release, so its page was removed from All The Tools. The operator itself is unchanged. |

## Excluded operators

| Source file and class | `bl_idname` | Label | Decision | Evidence |
| --- | --- | --- | --- | --- |
| `utilities/_operators.py` `MMT_OT_UtilitiesInvoke` | `mmt.invoke` | (blank) | Internal | Registered in `utilities/__init__.py` with `bl_options = {'INTERNAL'}`, so it's hidden from F3. A search of the whole add-on finds no menu, panel, button, keymap or script reference, and its `bl_label` is blank. It exists to open a menu as though from the 3D Viewport. |

## Properties left off pages

Everything else in each published operator's RNA, including nested property groups, is in a page's parameter list.

| `bl_idname` | Property | Reason |
| --- | --- | --- |
| `mmt.export` | `filepath` | file browser path, only its folder is used |
| `mmt.export` | `check_existing` | inherited ExportHelper setting, not configured |
| `mmt.export` | `filter_glob` | hidden file filter |
| `mmt.export` | `settings` | container, expanded above |
| `mmt.export` | `settings.filmbox.animations` | declared but not drawn, stays at its default of on |
| `mmt.export` | `settings.filmbox.use_mesh_modifiers` | declared but not drawn and never read by the export |
| `mmt.generate_loops` | `settings` | container, expanded above |
| `mmt.generate_loops` | `settings.bones` | collection, expanded above |
| `mmt.generate_loops` | `settings.bones[].bone` | shown as the box label |
| `mmt.import` | `filepath` | file browser path |
| `mmt.import` | `files` | hidden multi file list |
| `mmt.import` | `directory` | hidden file browser folder |
| `mmt.import` | `filter_glob` | hidden file filter |
| `mmt.import` | `settings` | container, expanded above |
| `mmt.oriented` | `original_preserve` | hidden internal flag |
| `mmt.oriented` | `oriented_preserve` | hidden internal flag |
| `mmt.redirect_motion` | `settings` | container, expanded above |
| `mmt.redirect_motion` | `settings.actions` | collection, expanded above |
| `mmt.redirect_motion` | `settings.actions[].directions` | collection, expanded above |
| `mmt.redirect_motion` | `axis` | script only, used when no actions are listed |
| `mmt.redirect_motion` | `angle` | script only, used when no actions are listed |
| `mmt.redirect_motion` | `action_name` | script only, used when no actions are listed |
| `mmt.redirect_motion` | `from_tracks` | hidden internal flag |
| `mmt.split_action` | `settings` | container, expanded above |
| `mmt.split_action` | `settings.splits` | collection, expanded above |
| `mmt.split_action` | `settings.source_name` | hidden internal state |
| `mmt.split_action` | `settings.source_start` | hidden internal state |
| `mmt.split_action` | `settings.source_end` | hidden internal state |
| `mmt.split_action` | `settings.resizing` | hidden internal guard |
| `mmt.transfer_motion` | `settings` | container, expanded above |
| `mmt.transfer_motion` | `settings.transfers` | collection, expanded above |

## Items for human review

| Item | Finding |
| --- | --- |
| `mmt.shapes` Only Active | `rigging/_operators.py`: **Only Active** is declared and drawn in Save mode, but `execute()` never reads it and saves every selected mesh. The page documents what the code does. |
| `mmt.import` Root Length | `importing/_properties.py` declares it and `_interface.py` draws it, but no code reads it. `set_imported_assets` uses `orientation.max_length` for an added root bone. The page documents what the code does. |
| `mmt.import` Orient Armature | The description says it creates an oriented armature for any imported armature. `set_imported_assets` only does so in the retarget mesh branch, which needs a Target, Meshes on and skeletal meshes. The page documents what the code does. |
| `mmt.export` hidden settings | `MMT_PG_ExportingFBX.animations` isn't drawn, though it still enables **Sampling Rate** and **Simplify** and feeds `bake_anim`. `use_mesh_modifiers` isn't drawn or read by the export, and its description mentions an add-on called Armature Intuitive Meshes. Neither is on the page as a setting. |
| `mmt.export` Background Export wording | The source description reads "against in a background process because so the open file remains untouched (Warning; only set false for debugging)". The page uses a cleaned up version of it. The source could use the same fix. |
| `mmt.pose` Apply with a Rigging armature | `set_retargeted_rigging` exists in `retargeting/_functions.py` but nothing calls it. `set_retargeted_armature` replaces the Oriented armature and doesn't rebuild or reparent a Rigging armature above it. The page says no branch rebuilds it. Is that intended? |
| `mmt.mirror` and `mmt.blend` from F3 | Neither has a `poll()`. `invoke()` and `draw()` read `context.active_object.data.shape_keys`, which raises an error on an active object with no such attribute. The menu row greys out, but F3 doesn't. The Mirror and Blend pages state this. `mmt.extract` reads `mesh.data.shape_keys` from `execute()` with no check either. |
| Operators with no `poll()` on the active object | `mmt.oriented`, `mmt.orient`, `mmt.weight` and `mmt.fcurve` have no `poll()`, and it wasn't tested what `mmt.oriented` and `mmt.orient` do from F3 on the wrong object type. The pages give their requirements and don't claim a specific failure. |
| `mmt.extract` in Edit mode | `get_shape_meshes` reads shape key data without leaving Edit mode, whereas Mirror and Blend switch to Object mode first. Whether unflushed edits are included wasn't tested, so the page doesn't say. |
| `mmt.clean` with empty material slots | `set_cleaned_meshes` reads `m.name` on every material, which would raise an error on an empty slot. This wasn't tested and isn't on the page. |
| `mmt.snap` stretched FK limit | Earlier project notes record that snapping can't reproduce a manually stretched FK bend through IK. No source comment states this, so it isn't on the page. Should it be added as a limitation? |
| `mmt.snap` bl_label | `bl_label` is "Snap IK to FK" for both directions, so F3 and the redo panel title say that even for FK to IK. The page title follows the label. |
| `keyframing/__init__.py` comment | The comment says split, transfer and redirect go in the Apply menu, but `add_keyframing_operators` also adds `mmt.generate_loops`. The page follows the code. `mmt.generate_locomotion` is F3 only, as the comment says. |
| `mmt.generate_loops` naming | `bl_idname` says generate loops and `bl_label` says Add Oscillatory Motion. The page title follows the label. |
| `mmt.actions` naming | `bl_label` is Retarget, while the menu shows Retarget Actions To and From. The page title follows the label. |
| `mmt.import` and `mmt.export` titles | Both have the `bl_label` Mr Mannequins FBX, and titles have to be unique, so the pages are titled Import Mr Mannequins FBX and Export Mr Mannequins FBX. The label is still given on each page. |
| `mmt.mirror` enum wording | The Blend item's source description reads "over the the X axis". The page drops the repeated word. The source could use the same fix. |
| `mmt.invoke` | It's registered but nothing calls it. It may be dead code rather than infrastructure, but either way it's excluded because it's `INTERNAL`. |
| `bl_info` location | `__init__.py` gives the location as `3D Viewport > Pose`, which only covers part of what's now exposed. This doesn't affect any page. |
| UI facts not verified headlessly | Enabled and greyed states, panel layout, dialog widths and keymap behaviour were read from source and not seen on screen. Blender's menu labels and RNA values were checked headlessly in Blender 5.0.0. |
