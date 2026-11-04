---
title: Custom Shapes
parent: Rigging
grand_parent: All The Tools
nav_order: 3
permalink: /all_the_tools/rigging/custom_shapes/
---

# Custom Shapes

**Custom Shapes** (`mmt.shapes`) saves or loads custom bone shapes. Saving is stored from mesh evaluations and only supports sharp edges. It's at `Object > Save Custom Shape` and `Object > Load Custom Shape`, and in F3 Operator Search, which uses the Save mode.

{% include media/youtube.html title="Saving a mesh as a custom bone shape from Object > Save Custom Shape, picking it in a shape picker, then loading it back into the scene" %}

**Save** needs selected mesh objects. Each one is written to a `.py` file in the add-on's `rigging/shapes` folder, named from the mesh in lowercase, and modifiers are included because the evaluated mesh gets stored. Only vertices, edges, faces and sharp edge flags are stored. Saved shapes then appear in every shape picker in the add-on. **Warning:** saving overwrites a shape file with the same name. If the shapes folder isn't writable, saving quietly does nothing.

**Load** needs nothing, and links into the active object's collections, or the scene collection when nothing is active. The shape object is created if it isn't in the file already. A shape that's already in a collection isn't linked twice, and picking None does nothing.

- **Mode** (`mode`) — Choice; default Save. What are we doing to a custom shapes. Set by the menu entry.
  - **Save** (`SAVE`): This is **Save Custom Shape**.
  - **Load** (`LOAD`): This is **Load Custom Shape**.
- **Only Active** (`active`) — Checkbox; default On. Only save the active mesh as a custom shape. Save mode only. Shown, but it has no effect, since Save always writes every selected mesh.
- **Shape** (`shape`) — Choice; default first item (None); dynamic list. The custom shape to load. Load mode only. The list is every `.py` file in `rigging/shapes`.
