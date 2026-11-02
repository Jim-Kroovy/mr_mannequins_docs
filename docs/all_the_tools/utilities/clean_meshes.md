---
title: Clean Meshes
parent: Utilities
grand_parent: All The Tools
nav_order: 2
permalink: /all_the_tools/utilities/clean_meshes/
---

# Clean Meshes

**Operator:** `mmt.clean`  
**Label:** Clean Meshes

Cleans shape keys, vertex groups and materials by prefix.

## Location

- `Object > Apply > Clean Meshes`
- F3 Operator Search

## Requirements

- Selected visible meshes. There's no `poll()` check.

## Usage

1. Select the meshes in Object mode.
2. Run the operator.
3. Set **Clean Prefix** and turn on what to clean in the redo panel.

## Result

- Anything enabled with a name starting with the prefix is removed from each mesh. Materials are removed by slot.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Clean Prefix<br>`prefix` | Text | `DEL_` |  | The prefix used to clean shape keys, vertex groups and materials. |
| Clean Shapes<br>`shapes` | Checkbox | Off |  | Remove shape keys with the clean prefix. |
| Clean Groups<br>`groups` | Checkbox | Off |  | Remove vertex groups with the clean prefix. |
| Clean Materials<br>`materials` | Checkbox | Off |  | Remove materials with the clean prefix. |

## Limitations

- Nothing is removed until at least one of the three options is on.
- **Warning:** an empty prefix matches every name, so it removes everything the enabled options cover.

## Related Operators

- [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %}): Runs the same cleanup on the exported copy from its Cleaning panel.
- [Apply Meshes]({% link docs/all_the_tools/utilities/apply_meshes.md %}): The other mesh cleanup in this menu.

## Related Documentation

- Planned: a Useful Utilities page for this tool.
