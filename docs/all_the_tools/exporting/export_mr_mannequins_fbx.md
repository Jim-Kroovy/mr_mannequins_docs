---
title: Export Mr Mannequins FBX
parent: Exporting
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/exporting/export_mr_mannequins_fbx/
---

# Export Mr Mannequins FBX

**Mr Mannequins FBX** (`mmt.export`) exports armatures and meshes as compatible FBX files, with baked actions, batching and optional cleanup of prefixed data. It's at `File > Export > Mr Mannequins FBX (.fbx)` and in F3 Operator Search. Pick a folder in the file browser, set the panels and confirm. The Cleaning and Advanced panels are collapsed by default.

There's no `poll()` check, but with **Only Selected** on, something exportable has to be selected for anything to be written. Selecting a mesh also pulls in its armature. Actions come from the highest tier in the armature's hierarchy, and the export armature is the Original when there is one, otherwise the Oriented.

FBX files go into the chosen folder, or into the **Folder** subfolder set for meshes or actions, which is created when it doesn't exist. Only the folder from the file browser is used, because every file name comes from the asset being exported. Any run of non alphanumeric characters in a file name becomes an underscore. Batched meshes use the mesh name, and socket meshes add `_<bone>` when **Socket Suffices** is on. Unbatched skeletal meshes write `<armature>_Meshes.fbx`, unbatched static meshes write `<blend file>_Meshes.fbx` (or `Static_Meshes.fbx` in an unsaved file), batched actions use the action name, and unbatched actions are merged into `<armature>_Actions.fbx` as separate FBX animation stacks. Static and socket meshes have their object transforms cleared first, so they export from the origin.

With **Background Export** on, the export runs on a temporary copy of the file in a background Blender process and the open file isn't changed. A failed background export reports Blender's error output and cancels. **Warning:** with it off, the export runs on the open file. It changes the scene unit scale and length unit, applies modifiers, unhides objects and scales the armature, and only restores the selection and mode afterwards. **Warning:** Cleaning removes data from the exported copy only when **Background Export** is on. With it off, the open file loses that data too.

Cleaning runs last on each mesh set, right before export, so prefixed data can still feed modifiers. It doesn't run if the prefix is empty, even with its checkboxes on. The Meshes, Actions, Cleaning and Advanced settings are remembered between exports and sessions, including when an export fails, and are reset when the add-on version changes. **Only Selected** and **Background Export** aren't part of that saved group. The default **Only Stashed** method exports what [Split Active Action]({% link docs/all_the_tools/keyframing/split_active_action.md %}) and other stashing tools leave in the NLA.

- **Meshes > Export** (`export`) — Checkbox; default On. Export meshes. Panel header checkbox.
- **Meshes > Folder** (`folder`) — Text; default empty. The folder in the export directory to export meshes to. Available when Meshes Export is on.
- **Meshes > Apply Modifiers** (`modifiers`) — Checkbox; default On. Apply modifiers non-destructively before export (supports shape keys). Available when Meshes Export is on.
- **Meshes > Batch Export** (`batch`) — Checkbox; default On. Batch export meshes to individual files (socket meshes always batch export). Available when Meshes Export is on.
- **Meshes > Socket Suffices** (`suffix`) — Checkbox; default On. Add socket bone name as a suffix to the exported file (only for socket meshes). Available when Meshes Export is on.
- **Meshes > Static Meshes** (`static`) — Checkbox; default On. Export static meshes. Available when Meshes Export is on.
- **Meshes > Skeletal Meshes** (`skeletal`) — Checkbox; default On. Export skeletal meshes. Available when Meshes Export is on.
- **Meshes > Socket Meshes** (`socket`) — Checkbox; default On. Export socket meshes. Available when Meshes Export is on.
- **Actions > Export** (`export`) — Checkbox; default On. Export actions. Panel header checkbox.
- **Actions > Folder** (`folder`) — Text; default empty. The folder in the export directory to export these actions to. Available when Actions Export is on.
- **Actions > Method** (`method`) — Choice; default Only Stashed. Which actions on the armature get exported. Available when Actions Export is on.
  - **Only Active**: Export only the active action on armatures
  - **Only Stashed**: Export only the stashed actions on armatures
  - **All Actions**: Export all actions that the armature can use
- **Actions > Batch Export** (`batch`) — Checkbox; default On. Batch export baked actions to individual files, otherwise merge them into one file as separate FBX animation stacks. Available when Actions Export is on.
- **Cleaning > Prefix** (`prefix`) — Text; default empty. Only clean data that starts with this prefix. Cleaning only runs when this isn't empty.
- **Cleaning > Shape Keys** (`shapes`) — Checkbox; default Off. Remove shape keys that start with the prefix.
- **Cleaning > Vertex Groups** (`groups`) — Checkbox; default Off. Remove vertex groups that start with the prefix.
- **Cleaning > Materials** (`materials`) — Checkbox; default Off. Remove material slots that start with the prefix.
- **Advanced > Scale** (`scaling`) — Float; default 1; min 0.001, max 1000. Scale all data.
- **Advanced > Forward** (`forward`) — Choice; default -Z Forward; options **X Forward**, **Y Forward**, **Z Forward**, **-X Forward**, **-Y Forward**, **-Z Forward**. Forward axis.
- **Advanced > Up** (`upward`) — Choice; default Y Up; options **X Up**, **Y Up**, **Z Up**, **-X Up**, **-Y Up**, **-Z Up**. Up axis.
- **Advanced > Smoothing** (`smoothing`) — Choice; default Face. Export smoothing information.
  - **Normals Only**: Export only normals instead of writing edge or face smoothing data
  - **Face**: Write face smoothing
  - **Edge**: Write edge smoothing
- **Advanced > Vertex Colors** (`colors`) — Choice; default sRGB. Export vertex color attributes.
  - **None**: Do not export color attributes
  - **sRGB**: Export colors in sRGB color space
  - **Linear**: Export colors in linear color space
- **Advanced > Prioritize Active Color** (`prioritize`) — Checkbox; default Off. Make sure the active color will be exported first (unless 'None' is chosen for Vertex Colors). Available when Vertex Colors isn't None.
- **Advanced > Loose Edges** (`edges`) — Checkbox; default Off. Export loose edges (as two-vertices polygons).
- **Advanced > Tangent Space** (`tangents`) — Checkbox; default Off. Add binormal and tangent vectors, together with normal they form the tangent space (will only work correctly with tris/quads only meshes).
- **Advanced > Triangulate Faces** (`triangles`) — Checkbox; default Off. Convert all faces to triangles.
- **Advanced > Primary Bone Axis** (`primary`) — Choice; default Y Axis; options **X Axis**, **Y Axis**, **Z Axis**, **-X Axis**, **-Y Axis**, **-Z Axis**. Primary bone axis.
- **Advanced > Secondary Bone Axis** (`secondary`) — Choice; default X Axis; options **X Axis**, **Y Axis**, **Z Axis**, **-X Axis**, **-Y Axis**, **-Z Axis**. Secondary bone axis.
- **Advanced > Sampling Rate** (`step`) — Float; default 1; min 0.01, max 100. How often to evaluate animated values (in frames).
- **Advanced > Simplify** (`simplify`) — Float; default 0; min 0, max 100. How much to simplify baked values (0.0 to disable, the higher the more simplified).
- **Advanced > Metadata** (`use_metadata`) — Checkbox; default On. Export metadata (creator, ...).
- **Advanced > Only Selected** (`only_selected`) — Checkbox; default On. Only include selected meshes and armatures. Changing it rescans the export assets.
- **Advanced > Background Export** (`background`) — Checkbox; default On. Run the export in a background process so the open file stays untouched. Only turn this off for debugging.
