---
title: Export Mr Mannequins FBX
parent: Exporting
grand_parent: All The Tools
nav_order: 1
permalink: /all-the-tools/exporting/export-mr-mannequins-fbx/
---

# Export Mr Mannequins FBX

**Operator:** `mmt.export`  
**Label:** Mr Mannequins FBX

Exports armatures and meshes as compatible FBX files, with baked actions, batching and optional cleanup of prefixed data.

## Location

- `File > Export > Mr Mannequins FBX (.fbx)`
- F3 Operator Search

## Requirements

- No `poll()` check. With **Only Selected** on, something exportable has to be selected for anything to be written.

## Usage

1. Select what you want to export, or turn off **Only Selected** in the Advanced panel.
2. Open the operator and pick a folder in the file browser.
3. Set the Meshes, Actions, Cleaning and Advanced panels.
4. Confirm the export.

{% include media/screenshot.html alt="File browser in File > Export > Mr Mannequins FBX, with the Meshes and Actions panels expanded in the right hand sidebar." %}

## Result

- FBX files are written into the chosen folder, or into the **Folder** subfolder set for meshes or actions. Subfolders are created when they don't exist.
- Only the folder from the file browser is used. Every file name comes from the asset being exported.
- File names have any run of non alphanumeric characters replaced with an underscore. Batched meshes use the mesh name, and socket meshes add `_<bone>` when **Socket Suffices** is on. Unbatched skeletal meshes write `<armature>_Meshes.fbx`, unbatched static meshes write `<blend file>_Meshes.fbx` (or `Static_Meshes.fbx` in an unsaved file), batched actions use the action name, and unbatched actions write `<armature>_Actions.fbx`.
- Unbatched actions are merged into one file as separate FBX animation stacks.
- With **Background Export** on, the export runs on a temporary copy of the file in a background Blender process, and the open file isn't changed.

## Properties

### Meshes panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Export<br>`export` | Checkbox | On |  | Export meshes.<br>*Panel header checkbox.* |
| Folder<br>`folder` | Text | Empty |  | The folder in the export directory to export meshes to.<br>*Meshes Export on.* |
| Apply Modifiers<br>`modifiers` | Checkbox | On |  | Apply modifiers non-destructively before export (supports shape keys).<br>*Meshes Export on.* |
| Batch Export<br>`batch` | Checkbox | On |  | Batch export meshes to individual files (socket meshes always batch export)<br>*Meshes Export on.* |
| Socket Suffices<br>`suffix` | Checkbox | On |  | Add socket bone name as a suffix to the exported file (only for socket meshes).<br>*Meshes Export on.* |
| Static Meshes<br>`static` | Checkbox | On |  | Export static meshes.<br>*Meshes Export on.* |
| Skeletal Meshes<br>`skeletal` | Checkbox | On |  | Export skeletal meshes.<br>*Meshes Export on.* |
| Socket Meshes<br>`socket` | Checkbox | On |  | Export socket meshes.<br>*Meshes Export on.* |

### Actions panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Export<br>`export` | Checkbox | On |  | Export actions.<br>*Panel header checkbox.* |
| Folder<br>`folder` | Text | Empty |  | The folder in the export directory to export these actions to.<br>*Actions Export on.* |
| Method<br>`method` | Choice | Only Stashed | **Only Active**: Export only the active action on armatures<br>**Only Stashed**: Export only the stashed actions on armatures<br>**All Actions**: Export all actions that the armature can use | Which actions on the armature get exported.<br>*Actions Export on.* |
| Batch Export<br>`batch` | Checkbox | On |  | Batch export baked actions to individual files, otherwise merge them into one file as separate FBX animation stacks.<br>*Actions Export on.* |

### Cleaning panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Prefix<br>`prefix` | Text | Empty |  | Only clean data that starts with this prefix.<br>*Collapsed by default. Cleaning only runs when this isn't empty.* |
| Shape Keys<br>`shapes` | Checkbox | Off |  | Remove shape keys that start with the prefix. |
| Vertex Groups<br>`groups` | Checkbox | Off |  | Remove vertex groups that start with the prefix. |
| Materials<br>`materials` | Checkbox | Off |  | Remove material slots that start with the prefix. |

### Advanced panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Scale<br>`scaling` | Float | 1 | Min 0.001, Max 1000 | Scale all data.<br>*Collapsed by default.* |
| Forward<br>`forward` | Choice | -Z Forward | **X Forward**<br>**Y Forward**<br>**Z Forward**<br>**-X Forward**<br>**-Y Forward**<br>**-Z Forward** | Forward axis. |
| Up<br>`upward` | Choice | Y Up | **X Up**<br>**Y Up**<br>**Z Up**<br>**-X Up**<br>**-Y Up**<br>**-Z Up** | Up axis. |
| Smoothing<br>`smoothing` | Choice | Face | **Normals Only**: Export only normals instead of writing edge or face smoothing data<br>**Face**: Write face smoothing<br>**Edge**: Write edge smoothing | Export smoothing information. |
| Vertex Colors<br>`colors` | Choice | sRGB | **None**: Do not export color attributes<br>**sRGB**: Export colors in sRGB color space<br>**Linear**: Export colors in linear color space | Export vertex color attributes. |
| Prioritize Active Color<br>`prioritize` | Checkbox | Off |  | Make sure the active color will be exported first (unless 'None' is chosen for Vertex Colors).<br>*Vertex Colors isn't None.* |
| Loose Edges<br>`edges` | Checkbox | Off |  | Export loose edges (as two-vertices polygons). |
| Tangent Space<br>`tangents` | Checkbox | Off |  | Add binormal and tangent vectors, together with normal they form the tangent space (will only work correctly with tris/quads only meshes). |
| Triangulate Faces<br>`triangles` | Checkbox | Off |  | Convert all faces to triangles. |
| Primary Bone Axis<br>`primary` | Choice | Y Axis | **X Axis**<br>**Y Axis**<br>**Z Axis**<br>**-X Axis**<br>**-Y Axis**<br>**-Z Axis** | Primary bone axis. |
| Secondary Bone Axis<br>`secondary` | Choice | X Axis | **X Axis**<br>**Y Axis**<br>**Z Axis**<br>**-X Axis**<br>**-Y Axis**<br>**-Z Axis** | Secondary bone axis. |
| Sampling Rate<br>`step` | Float | 1 | Min 0.01, Max 100 | How often to evaluate animated values (in frames). |
| Simplify<br>`simplify` | Float | 0 | Min 0, Max 100 | How much to simplify baked values (0.0 to disable, the higher the more simplified). |
| Metadata<br>`use_metadata` | Checkbox | On |  | Export metadata (creator, ...). |

### Advanced panel, operator settings

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Only Selected<br>`only_selected` | Checkbox | On |  | Only include selected meshes and armatures.<br>*Collapsed by default. Changing it rescans the export assets.* |
| Background Export<br>`background` | Checkbox | On |  | Run the export in a background process so the open file stays untouched. Only turn this off for debugging. |

## Limitations

- The Meshes, Actions, Cleaning and Advanced settings are remembered between exports and sessions, including when an export fails. They're reset when the add-on version changes. **Only Selected** and **Background Export** aren't part of that saved group.
- Selecting a mesh also pulls in its armature. Actions come from the highest tier in the armature's hierarchy, and the export armature is the Original when there is one, otherwise the Oriented.
- **Warning:** with **Background Export** off, the export runs on the open file. It changes the scene unit scale and length unit, applies modifiers, unhides objects and scales the armature, and only restores the selection and mode afterwards.
- **Warning:** Cleaning removes data from the exported copy only when **Background Export** is on. With it off, the open file loses that data too.
- Static and socket meshes have their object transforms cleared before export, so they export from the origin.
- Cleaning runs last on each mesh set, right before export, so prefixed data can still feed modifiers. It doesn't run if the prefix is empty, even with its checkboxes on.
- A failed background export reports Blender's error output and cancels.

## Related Operators

- [Import Mr Mannequins FBX]({% link docs/all-the-tools/importing/import-mr-mannequins-fbx.md %}): The matching FBX import.
- [Apply Meshes]({% link docs/all-the-tools/utilities/apply-meshes.md %}): The same modifier handling that **Apply Modifiers** uses here.
- [Clean Meshes]({% link docs/all-the-tools/utilities/clean-meshes.md %}): The same prefix cleanup as the Cleaning panel, run directly on the open file.
- [Socket Meshes]({% link docs/all-the-tools/skinning/socket-meshes.md %}): Makes the socket meshes this exports.
- [Split Active Action]({% link docs/all-the-tools/keyframing/split-active-action.md %}): Stashes actions, which is what the default **Only Stashed** method exports.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
