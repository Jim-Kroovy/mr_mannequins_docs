---
title: Template
parent: Templates
grand_parent: All The Tools
nav_order: 1
permalink: /all-the-tools/templates/template/
---

# Template

**Operator:** `mmt.template`  
**Label:** Template

Adds a saved template from the Mr Mannequins template library.

## Location

- `Add > Template`, then a template, in the 3D Viewport
- F3 Operator Search

## Requirements

- At least one `.blend` file in the add-on's `templates/library` folder.

## Usage

1. Open `Add > Template` and pick a template.
2. Set the **Ignore** options in the redo panel.

{% include media/screenshot.html alt="3D Viewport with the Add > Template menu open listing the library templates." %}

## Result

- The template's armatures, meshes and objects their constraints need are appended and linked into the active collection.
- Custom shapes stay referenced by the armature, without being linked into the scene.
- Repeated custom shapes, materials and images are switched to the copies already in the file.
- What was added ends up selected, with the last object active.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Template<br>`template` | Choice | First item | Dynamic list | The saved template to add.<br>*The list is every `.blend` file in the library, with underscores shown as spaces.* |
| Ignore Armatures<br>`ignore_armatures` | Checkbox | Off |  | Don't add the template's armature objects. |
| Ignore Meshes<br>`ignore_meshes` | Checkbox | Off |  | Don't add the template's mesh objects. |
| Ignore Materials<br>`ignore_materials` | Checkbox | Off |  | Don't add materials to the template's meshes. |
| Ignore Animations<br>`ignore_animations` | Checkbox | Off |  | Don't add animation data to the template's armatures. |

## Limitations

- **Ignore Armatures** also removes armature modifiers left without an object.
- An empty library shows **No Saved Templates** in the menu and reports an error from F3.
- It errors when the file is missing or has no armatures or meshes, and warns when everything was ignored.

## Related Operators

- [Set Oriented Armature]({% link docs/all-the-tools/orientation/set-oriented-armature.md %}): Creates an oriented armature for an added armature that doesn't have one.
- [Retarget]({% link docs/all-the-tools/retargeting/retarget.md %}): Retargets actions onto an added template.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
