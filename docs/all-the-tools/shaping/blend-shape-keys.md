---
title: Blend Shape Keys
parent: Shaping
grand_parent: All The Tools
nav_order: 1
permalink: /all-the-tools/shaping/blend-shape-keys/
---

# Blend Shape Keys

**Operator:** `mmt.blend`  
**Label:** Blend Shape Keys

Blends shape keys by vertex selection.

## Location

- `Mesh > Vertex > Blend Shape Keys` in Edit mode, greyed out unless the active object is a mesh with shape keys
- F3 Operator Search

## Requirements

- An active mesh with shape keys. There's no `poll()` check, so from F3 another active object type raises an error.
- A vertex selection with at least one unselected vertex connected to it by an edge.

## Usage

1. Select the vertices in Edit mode, with the shape key active.
2. Run the operator.
3. Pick **Shape**, and adjust the other settings in the redo panel.

{% include media/screenshot.html alt="3D Viewport in Edit mode with part of a face selected and the Blend Shape Keys redo panel open." %}

## Result

- Selected vertices are interpolated toward **Shape**, by their distance from the closest unselected border vertex.
- Vertices further than **Blend** reach **Alpha**. Closer ones blend in from zero at the border.
- The previous mode is restored. All selected visible meshes are processed.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Shape<br>`into` | Text | First shape key on the active object |  | The shape key to blend into. |
| Prefix<br>`prefix` | Text | Empty |  | Only blend shape keys using this prefix.<br>*Only Active off. Empty matches every shape key.* |
| Blend<br>`blend` | Float, distance | 0.1 | Min 0 | The distance used to blend out selected verts. |
| Alpha<br>`alpha` | Float | 1 | Min 0, Max 1 | Maximum interpolation to the target shape. |
| Smooth<br>`steps` | Integer | 0 | Min 0, Max 20 | Number of smoothing iterations. |
| Only Active<br>`active` | Checkbox | On |  | Only blend the active shape key. |

## Limitations

- A mesh with no border vertex, or no shape key named **Shape**, is skipped with a console message.
- **Smooth** only touches vertices inside the blend distance.
- With no **Shape** chosen, it warns and changes nothing.

## Related Operators

- [Mirror Shape Keys]({% link docs/all-the-tools/shaping/mirror-shape-keys.md %}): The other selection based shape key tool in this menu.
- [Extract Shape Keys]({% link docs/all-the-tools/shaping/extract-shape-keys.md %}): Breaks shape keys out into meshes.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
