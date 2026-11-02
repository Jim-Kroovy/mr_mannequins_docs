---
title: Extract Shape Keys
parent: Shaping
grand_parent: All The Tools
nav_order: 2
permalink: /all_the_tools/shaping/extract_shape_keys/
---

# Extract Shape Keys

**Operator:** `mmt.extract`  
**Label:** Extract Shape Keys

Extracts shape keys on the edited mesh into their own separate meshes.

## Location

- `Mesh > Vertex > Extract Shape Keys` in Edit mode, greyed out unless the active object is a mesh with shape keys
- F3 Operator Search

## Requirements

- An active mesh with shape keys. There's no `poll()` check.

## Usage

1. Make the mesh active, in Edit mode from the menu.
2. Run the operator.
3. Turn off **Only Active** in the redo panel to extract them all.

## Result

- Each extracted shape key becomes a copy of the object, named after the key, with that key's positions as its geometry and no shape keys.
- Copies are linked into the same collections as the mesh.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Only Active<br>`active` | Checkbox | On |  | Only extract the active shape key. |

## Limitations

- With **Only Active** off the first key, the basis, isn't extracted. With it on, the active key is extracted even when it's the basis.
- The copies carry over the object's modifiers.

## Related Operators

- [Mirror Shape Keys]({% link docs/all_the_tools/shaping/mirror_shape_keys.md %}): Works on shape keys in the same menu.
- [Blend Shape Keys]({% link docs/all_the_tools/shaping/blend_shape_keys.md %}): Works on shape keys in the same menu.
- [Apply Meshes]({% link docs/all_the_tools/utilities/apply_meshes.md %}): Uses the same extraction to keep shape keys through applied modifiers.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
