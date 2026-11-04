---
title: Apply Meshes
parent: Utilities
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/utilities/apply_meshes/
---

# Apply Meshes

**Apply Meshes** (`mmt.apply`) applies modifiers and transforms on meshes while preserving shape keys. It's at `Object > Apply > Apply Meshes` and in F3 Operator Search. It needs selected visible meshes, and there's no `poll()` check.

{% include media/youtube.html title="Applying modifiers on a mesh with shape keys using Apply Meshes with Keep Original on, then checking the shape keys still work on the duplicate" %}

With **Keep Original** on, the work happens on duplicates, and they end up selected. **Warning:** with it off, the selected meshes themselves are changed. Viewport active modifiers are applied, except the last armature modifier, which stays live. Shape keys are rebuilt by applying the same modifiers to each key and adding it back, starting at 0.0, and a key whose vertex count no longer matches is dropped, which the console reports. With an X axis Mirror modifier applied, mirrored materials are attempted based on their names. **Parent** clears the parent, keeping the world position, and the location, rotation and scale options then get applied. Every vertex gets deselected and unhidden.

- **Modifiers** (`modifiers`) — Checkbox; default On. Apply viewport active modifiers while preserving shape keys.
- **Parent** (`parent`) — Checkbox; default Off. Clear parent keeping world position.
- **Location** (`location`) — Checkbox; default Off. Apply location transform.
- **Rotation** (`rotation`) — Checkbox; default Off. Apply rotation transform.
- **Scale** (`scale`) — Checkbox; default Off. Apply scale transform.
- **Keep Original** (`original`) — Checkbox; default On. Keep original meshes.
