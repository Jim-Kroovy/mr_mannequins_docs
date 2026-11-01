---
title: Weight Meshes
parent: Skinning
grand_parent: All The Tools
nav_order: 2
permalink: /all-the-tools/skinning/weight-meshes/
---

# Weight Meshes

**Operator:** `mmt.weight`  
**Label:** Weight Meshes

Weights vertices around bones using an adjustable shape.

## Location

- `Weights > Weight Meshes` in Weight Paint mode
- F3 Operator Search

## Requirements

- A selected visible mesh with an armature modifier whose armature is also selected.
- Selected pose bones on that armature. There's no `poll()` check.

## Usage

1. Enter Weight Paint mode with the armature selected, and select the bones.
2. Run the operator.
3. Turn on **Show** and shape the weight volume in the redo panel.

{% include media/screenshot.html alt="3D Viewport in Weight Paint mode with one bone selected, Show on so the debug capsule is visible, and the Weight Meshes redo panel open." %}

## Result

- For each selected bone, a vertex group of the same name gets created when it's missing, and the shape's weight is written to it.
- Vertices inside the inner bound get full **Weight**, and vertices between the inner and outer bounds fall off.
- With **Show** on, wire debug meshes show the inner and outer bounds for each bone, and they're removed again automatically.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Mode<br>`mode` | Choice | Replace | **Replace**: Replace existing values<br>**Add**: Add to existing values<br>**Subtract**: Subtract from existing values | How to affect values. |
| Shape<br>`shape` | Choice | Sphere | **Sphere**: Add weight using a sphere<br>**Cylinder**: Add weight using a cylinder<br>**Capsule**: Add weight using a cylinder with rounded ends<br>**Cube**: Add weight using a box shape | What shape of weighting to use. |
| Offset<br>`offset` | Float x3, translation | (0, 0, 0) | Unbounded | 3D location of the weight shape. |
| Rotate<br>`rotate` | Float x3, euler | (0°, 0°, 0°) | Unbounded | 3D rotation of the weight shape. |
| Scale<br>`scale` | Float x3, xyz | (1, 1, 1) | Unbounded | 3D scale of the weight shape. |
| Origin<br>`origin` | Float | 0.5 | Min 0, Max 1 | Origin of the shape along the bone. |
| Taper<br>`taper` | Float | 0 | Min 0, Max 1 | Factor to taper the end of the shape.<br>*Shape is Cylinder, Capsule or Cube.* |
| Blend<br>`blend` | Float | 0.5 | Min 0, Max 1 | Factor to begin blending bone weight from. |
| Weight<br>`weight` | Float | 0.5 | Min 0, Max 1 | Weight to apply to vertices. |
| Invert<br>`invert` | Checkbox | Off |  | Invert the weighting. |
| Remove<br>`remove` | Checkbox | Off |  | Remove unaffected values. |
| Show<br>`show` | Checkbox | Off |  | Show the shape as wire frame meshes. |

## Limitations

- The shape's outer size comes from half the bone's length, multiplied by **Scale**, and the inner size is that multiplied by **Blend**.
- Hidden vertices are skipped.
- Vertices are compared to bones without object transforms, so mesh and armature objects need to line up.
- Results under 0.00001 aren't written. With **Remove** on, those vertices are taken out of the group.

## Related Operators

- [Socket Meshes]({% link docs/all-the-tools/skinning/socket-meshes.md %}): Turns single bone weighted meshes into socket meshes.
- [Clean Meshes]({% link docs/all-the-tools/utilities/clean-meshes.md %}): Removes prefixed vertex groups.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
