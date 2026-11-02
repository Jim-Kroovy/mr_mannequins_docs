---
title: Mirror Shape Keys
parent: Shaping
grand_parent: All The Tools
nav_order: 3
permalink: /all_the_tools/shaping/mirror_shape_keys/
---

# Mirror Shape Keys

**Operator:** `mmt.mirror`  
**Label:** Mirror Shape Keys

Mirrors shape keys over the X axis by left and right affix.

## Location

- `Mesh > Vertex > Mirror Shape Keys` in Edit mode, greyed out unless the active object is a mesh with shape keys
- F3 Operator Search

## Requirements

- An active mesh with shape keys. There's no `poll()` check, so from F3 another active object type raises an error.
- Vertices with a mirrored counterpart on the X axis.

## Usage

1. Make the shape key active, in Edit mode from the menu.
2. Run the operator.
3. Set **Method** and the other settings in the redo panel.

{% include media/screenshot.html alt="3D Viewport in Edit mode on a symmetrical mesh, with a left shape key active and the Mirror Shape Keys redo panel open." %}

## Result

- The mirrored shape key is written, or added when it doesn't exist. Its name swaps the left and right part of the original's name.
- All selected visible meshes are processed, and the previous mode is restored.
- With **Only Active** on, Blend leaves both keys at 1.0, and Flip leaves the mirror at 1.0 and the original at 0.0.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Method<br>`method` | Choice | Blend | **Blend**: Clear opposing sides with a blend over the X axis<br>**Flip**: Flip the shape key over the X axis without any blending | How to mirror the shape key. |
| Basis<br>`basis` | Text | First shape key on the active object |  | The shape key to use as the basis for blended mirroring.<br>*Method is Blend.* |
| Prefix<br>`prefix` | Text | Empty |  | Only mirror shape keys using this prefix.<br>*Only Active off. Empty matches every shape key.* |
| Blend<br>`blend` | Float, distance | 0.1 | Min 0 | Central blending distance for mirrored shape keys.<br>*Method is Blend.* |
| Only Active<br>`active` | Checkbox | On |  | Only mirror the active shape key. |
| Only Selected<br>`selected` | Checkbox | Off |  | Only mirror selected vertices. |

## Variants

### Method

- **Blend** clears the opposing sides with a blend over the X axis, writing back to both keys.
- **Flip** flips the shape key over the X axis with no blending, and leaves the original key's data alone.

### Which keys get mirrored

- **Only Active** on: the active key, even without a side in its name, in which case the new key is named `<name>.001`.
- **Only Active** off: every key matching **Prefix** that has a left or right name part. Once a pair is handled it isn't mirrored back.

## Limitations

- Recognised sides are `L`, `R`, `l`, `r`, `LEFT`, `RIGHT`, `Left`, `Right`, `left` and `right`, as parts of a name split on `_`, space, `.`, `:` or a camelCase boundary.
- Locked keys aren't written, though an existing mirror still gets reset to the basis first.
- Vertices with no counterpart are left where they are, and the console reports how many mirrored.

## Related Operators

- [Blend Shape Keys]({% link docs/all_the_tools/shaping/blend_shape_keys.md %}): The other selection based shape key tool in this menu.
- [Extract Shape Keys]({% link docs/all_the_tools/shaping/extract_shape_keys.md %}): Breaks shape keys out into meshes.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
