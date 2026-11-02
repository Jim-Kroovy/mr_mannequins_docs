---
title: Weight Meshes
parent: Skinning
grand_parent: All The Tools
nav_order: 2
permalink: /all_the_tools/skinning/weight_meshes/
---

# Weight Meshes

**Weight Meshes** (`mmt.weight`) weights vertices around bones using an adjustable shape. It's at `Weights > Weight Meshes` in Weight Paint mode and in F3 Operator Search. It needs a selected visible mesh with an armature modifier whose armature is also selected, and selected pose bones on that armature. There's no `poll()` check.

For each selected bone, a vertex group of the same name gets created when it's missing, and the shape's weight is written to it. Vertices inside the inner bound get full **Weight**, and vertices between the inner and outer bounds fall off. The shape's outer size comes from half the bone's length, multiplied by **Scale**, and the inner size is that multiplied by **Blend**. With **Show** on, wire debug meshes show the inner and outer bounds for each bone, and they're removed again automatically.

Hidden vertices are skipped. Vertices are compared to bones without object transforms, so mesh and armature objects need to line up. Results under 0.00001 aren't written, and with **Remove** on, those vertices are taken out of the group.

- **Mode** (`mode`) — Choice; default Replace. How to affect values.
  - **Replace**: Replace existing values
  - **Add**: Add to existing values
  - **Subtract**: Subtract from existing values
- **Shape** (`shape`) — Choice; default Sphere. What shape of weighting to use.
  - **Sphere**: Add weight using a sphere
  - **Cylinder**: Add weight using a cylinder
  - **Capsule**: Add weight using a cylinder with rounded ends
  - **Cube**: Add weight using a box shape
- **Offset** (`offset`) — Float x3, translation; default (0, 0, 0); unbounded. 3D location of the weight shape.
- **Rotate** (`rotate`) — Float x3, euler; default (0°, 0°, 0°); unbounded. 3D rotation of the weight shape.
- **Scale** (`scale`) — Float x3, xyz; default (1, 1, 1); unbounded. 3D scale of the weight shape.
- **Origin** (`origin`) — Float; default 0.5; min 0, max 1. Origin of the shape along the bone.
- **Taper** (`taper`) — Float; default 0; min 0, max 1. Factor to taper the end of the shape. Available when Shape is Cylinder, Capsule or Cube.
- **Blend** (`blend`) — Float; default 0.5; min 0, max 1. Factor to begin blending bone weight from.
- **Weight** (`weight`) — Float; default 0.5; min 0, max 1. Weight to apply to vertices.
- **Invert** (`invert`) — Checkbox; default Off. Invert the weighting.
- **Remove** (`remove`) — Checkbox; default Off. Remove unaffected values.
- **Show** (`show`) — Checkbox; default Off. Show the shape as wire frame meshes.
