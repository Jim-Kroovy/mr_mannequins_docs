---
title: Load Template
parent: Templates
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/templates/template/
---

# Load Template

**Load Template** (`mmt.template`) adds a saved template from the Mr Mannequins template library. It's at `Add > Template`, then a template, in the 3D Viewport, and in F3 Operator Search. It needs at least one `.blend` file in the add-on's `templates/library` folder. An empty library shows **No Saved Templates** in the menu and reports an error from F3.

{% include media/youtube.html title="Loading a template from Add > Template in the 3D Viewport and looking over the armatures and meshes it adds" %}

The template's armatures, meshes and objects their constraints need are appended and linked into the active collection. Custom shapes stay referenced by the armature, without being linked into the scene, and repeated custom shapes, materials and images are switched to the copies already in the file. What was added ends up selected, with the last object active. **Ignore Armatures** also removes armature modifiers left without an object. It errors when the file is missing or has no armatures or meshes, and warns when everything was ignored.

- **Template** (`template`) — Choice; default first item; dynamic list. The saved template to add. The list is every `.blend` file in the library, with underscores shown as spaces.
- **Ignore Armatures** (`ignore_armatures`) — Checkbox; default Off. Don't add the template's armature objects.
- **Ignore Meshes** (`ignore_meshes`) — Checkbox; default Off. Don't add the template's mesh objects.
- **Ignore Materials** (`ignore_materials`) — Checkbox; default Off. Don't add materials to the template's meshes.
- **Ignore Animations** (`ignore_animations`) — Checkbox; default Off. Don't add animation data to the template's armatures.
