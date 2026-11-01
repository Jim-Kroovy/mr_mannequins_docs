---
title: Custom Shapes
parent: Rigging
grand_parent: All The Tools
nav_order: 3
permalink: /all-the-tools/rigging/custom-shapes/
---

# Custom Shapes

**Operator:** `mmt.shapes`  
**Label:** Custom Shapes

Saves or loads custom bone shapes. Saving is stored from mesh evaluations and only supports sharp edges.

## Location

- `Object > Save Custom Shape`
- `Object > Load Custom Shape`
- F3 Operator Search, which uses the Save mode

## Requirements

- **Save:** selected mesh objects.
- **Load:** nothing, it links into the active object's collections, or the scene collection when nothing is active.

## Usage

1. For saving, select the meshes and choose **Save Custom Shape**.
2. For loading, choose **Load Custom Shape** and pick a **Shape** in the redo panel.

## Result

- **Save:** each selected mesh is written to a `.py` file in the add-on's `rigging/shapes` folder, named from the mesh in lowercase. Modifiers are included because the evaluated mesh gets stored.
- **Load:** the shape object is created if it isn't in the file already, and linked into the collections. A shape that's already in a collection isn't linked twice, and picking None does nothing.
- Saved shapes then appear in every shape picker in the add-on.

## Properties

### Redo panel, Save

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Only Active<br>`active` | Checkbox | On |  | Only save the active mesh as a custom shape.<br>*Save mode. Shown, but see Limitations.* |

### Redo panel, Load

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Shape<br>`shape` | Choice | First item (None) | Dynamic list | The custom shape to load.<br>*Load mode. The list is every `.py` file in `rigging/shapes`.* |

## Variants

### Mode

- `SAVE` is **Save Custom Shape**.
- `LOAD` is **Load Custom Shape**.

## Limitations

- **Only Active** has no effect. Save always writes every selected mesh.
- **Warning:** saving overwrites a shape file with the same name.
- If the shapes folder isn't writable, saving quietly does nothing.
- Only vertices, edges, faces and sharp edge flags are stored.

## Related Operators

- [Set Oriented Armature]({% link docs/all-the-tools/orientation/set-oriented-armature.md %}): Picks from these shapes for its bones.
- [Add Rigging Module]({% link docs/all-the-tools/rigging/add-rigging-module.md %}): Builds modules that use these shapes in their Shapes settings.

## Related Documentation

- Planned: the Rapid Rigging module guides.
