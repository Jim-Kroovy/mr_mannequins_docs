---
title: Mirror Shape Keys
parent: Shaping
grand_parent: All The Tools
nav_order: 3
permalink: /all_the_tools/shaping/mirror_shape_keys/
---

# Mirror Shape Keys

**Mirror Shape Keys** (`mmt.mirror`) mirrors shape keys over the X axis by left and right affix. It's at `Mesh > Vertex > Mirror Shape Keys` in Edit mode, greyed out unless the active object is a mesh with shape keys, and in F3 Operator Search. It needs an active mesh with shape keys, and vertices with a mirrored counterpart on the X axis. There's no `poll()` check, so from F3 another active object type raises an error.

{% include media/youtube.html title="Mirroring a left side shape key onto the right with Mirror Shape Keys, comparing Blend with Flip" %}

The mirrored shape key is written, or added when it doesn't exist, and its name swaps the left and right part of the original's name. All selected visible meshes are processed, and the previous mode is restored. **Blend** clears the opposing sides with a blend over the X axis, writing back to both keys. **Flip** flips the shape key over the X axis with no blending, and leaves the original key's data alone. With **Only Active** on, Blend leaves both keys at 1.0, and Flip leaves the mirror at 1.0 and the original at 0.0.

**Only Active** on mirrors the active key, even without a side in its name, in which case the new key is named `<name>.001`. Off, it mirrors every key matching **Prefix** that has a left or right name part, and once a pair is handled it isn't mirrored back. Recognised sides are `L`, `R`, `l`, `r`, `LEFT`, `RIGHT`, `Left`, `Right`, `left` and `right`, as parts of a name split on `_`, space, `.`, `:` or a camelCase boundary.

Locked keys aren't written, though an existing mirror still gets reset to the basis first. Vertices with no counterpart are left where they are, and the console reports how many mirrored.

- **Method** (`method`) — Choice; default Blend. How to mirror the shape key.
  - **Blend**: Clear opposing sides with a blend over the X axis
  - **Flip**: Flip the shape key over the X axis without any blending
- **Basis** (`basis`) — Text; default first shape key on the active object. The shape key to use as the basis for blended mirroring. Available when Method is Blend.
- **Prefix** (`prefix`) — Text; default empty. Only mirror shape keys using this prefix. Available when Only Active is off. Empty matches every shape key.
- **Blend** (`blend`) — Float, distance; default 0.1; min 0. Central blending distance for mirrored shape keys. Available when Method is Blend.
- **Only Active** (`active`) — Checkbox; default On. Only mirror the active shape key.
- **Only Selected** (`selected`) — Checkbox; default Off. Only mirror selected vertices.
