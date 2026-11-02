---
title: Extract Shape Keys
parent: Shaping
grand_parent: All The Tools
nav_order: 2
permalink: /all_the_tools/shaping/extract_shape_keys/
---

# Extract Shape Keys

**Extract Shape Keys** (`mmt.extract`) extracts shape keys on the edited mesh into their own separate meshes. It's at `Mesh > Vertex > Extract Shape Keys` in Edit mode, greyed out unless the active object is a mesh with shape keys, and in F3 Operator Search. It needs an active mesh with shape keys, and there's no `poll()` check.

Each extracted shape key becomes a copy of the object, named after the key, with that key's positions as its geometry and no shape keys. Copies are linked into the same collections as the mesh, and they carry over the object's modifiers. With **Only Active** off the first key, the basis, isn't extracted. With it on, the active key is extracted even when it's the basis.

- **Only Active** (`active`) — Checkbox; default On. Only extract the active shape key.
