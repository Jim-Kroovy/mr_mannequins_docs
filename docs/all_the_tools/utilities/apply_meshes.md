---
title: Apply Meshes
parent: Utilities
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/utilities/apply_meshes/
---

# Apply Meshes

**Operator:** `mmt.apply`  
**Label:** Apply Meshes

Applies modifiers and transforms on meshes while preserving shape keys.

## Location

- `Object > Apply > Apply Meshes`
- F3 Operator Search

## Requirements

- Selected visible meshes. There's no `poll()` check.

## Usage

1. Select the meshes in Object mode.
2. Run the operator.
3. Choose what to apply in the redo panel.

{% include media/screenshot.html alt="3D Viewport in Object mode with a mesh selected, the Object > Apply menu showing Apply Meshes, and its redo panel open." %}

## Result

- With **Keep Original** on, the work happens on duplicates, and they end up selected.
- Viewport active modifiers are applied, except the last armature modifier, which stays live.
- Shape keys are rebuilt by applying the same modifiers to each key and adding it back. Keys start at 0.0.
- With an X axis Mirror modifier applied, mirrored materials are attempted based on their names.
- **Parent** clears the parent, keeping the world position, and the location, rotation and scale options then get applied.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Modifiers<br>`modifiers` | Checkbox | On |  | Apply viewport active modifiers while preserving shape keys. |
| Parent<br>`parent` | Checkbox | Off |  | Clear parent keeping world position. |
| Location<br>`location` | Checkbox | Off |  | Apply location transform. |
| Rotation<br>`rotation` | Checkbox | Off |  | Apply rotation transform. |
| Scale<br>`scale` | Checkbox | Off |  | Apply scale transform. |
| Keep Original<br>`original` | Checkbox | On |  | Keep original meshes. |

## Limitations

- A shape key whose vertex count no longer matches after applying is dropped, and the console reports it.
- Every vertex gets deselected and unhidden.
- **Warning:** with **Keep Original** off, the selected meshes themselves are changed.

## Related Operators

- [Clean Meshes]({% link docs/all_the_tools/utilities/clean_meshes.md %}): The other mesh cleanup in this menu.
- [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %}): Does this on export with its Apply Modifiers setting.
- [Extract Shape Keys]({% link docs/all_the_tools/shaping/extract_shape_keys.md %}): Breaks shape keys out, without applying anything.

## Related Documentation

- Planned: a Useful Utilities page for this tool.
