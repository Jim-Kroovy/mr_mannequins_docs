---
title: Blend Shape Keys
parent: Shaping
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/shaping/blend_shape_keys/
---

# Blend Shape Keys

**Blend Shape Keys** (`mmt.blend`) blends shape keys by vertex selection. It's at `Mesh > Vertex > Blend Shape Keys` in Edit mode, greyed out unless the active object is a mesh with shape keys, and in F3 Operator Search. It needs an active mesh with shape keys, and a vertex selection with at least one unselected vertex connected to it by an edge. There's no `poll()` check, so from F3 another active object type raises an error.

{% include media/youtube.html title="Blending a shape key into a vertex selection with Blend Shape Keys and adjusting Shape, Blend, Alpha and Smooth in the redo panel" %}

Selected vertices are interpolated toward **Shape**, by their distance from the closest unselected border vertex. Vertices further than **Blend** reach **Alpha**, and closer ones blend in from zero at the border. **Smooth** only touches vertices inside the blend distance. All selected visible meshes are processed and the previous mode is restored. A mesh with no border vertex, or no shape key named **Shape**, is skipped with a console message. With no **Shape** chosen, it warns and changes nothing.

- **Shape** (`into`) — Text; default first shape key on the active object. The shape key to blend into.
- **Prefix** (`prefix`) — Text; default empty. Only blend shape keys using this prefix. Available when Only Active is off. Empty matches every shape key.
- **Blend** (`blend`) — Float, distance; default 0.1; min 0. The distance used to blend out selected verts.
- **Alpha** (`alpha`) — Float; default 1; min 0, max 1. Maximum interpolation to the target shape.
- **Smooth** (`steps`) — Integer; default 0; min 0, max 20. Number of smoothing iterations.
- **Only Active** (`active`) — Checkbox; default On. Only blend the active shape key.
