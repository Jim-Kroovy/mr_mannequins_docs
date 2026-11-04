---
title: Clean Meshes
parent: Utilities
grand_parent: All The Tools
nav_order: 2
permalink: /all_the_tools/utilities/clean_meshes/
---

# Clean Meshes

**Clean Meshes** (`mmt.clean`) cleans shape keys, vertex groups and materials by prefix. Anything enabled with a name starting with the prefix is removed from each mesh, and materials are removed by slot. It's at `Object > Apply > Clean Meshes` and in F3 Operator Search. It needs selected visible meshes, and there's no `poll()` check. Nothing is removed until at least one of the three options is on. **Warning:** an empty prefix matches every name, so it removes everything the enabled options cover.

{% include media/youtube.html title="Cleaning prefixed shape keys, vertex groups and materials off the selected meshes with Clean Meshes" %}

- **Clean Prefix** (`prefix`) — Text; default `DEL_`. The prefix used to clean shape keys, vertex groups and materials.
- **Clean Shapes** (`shapes`) — Checkbox; default Off. Remove shape keys with the clean prefix.
- **Clean Groups** (`groups`) — Checkbox; default Off. Remove vertex groups with the clean prefix.
- **Clean Materials** (`materials`) — Checkbox; default Off. Remove materials with the clean prefix.
