---
title: Add Rigging Module
parent: Rigging
grand_parent: All The Tools
nav_order: 1
permalink: /all-the-tools/rigging/add-rigging-module/
---

# Add Rigging Module

**Operator:** `mmt.add`  
**Label:** Add Rigging Module

Adds an empty rigging module. Pick its type in the Rigging dropdown to build it, or pick a type straight from the Add Rigging menu.

## Location

- `Pose > Add Rigging`, then a module type
- `Shift + A` in Pose mode opens the same menu
- `Properties > Armature > Rigging Modules`, the **+** button, which adds an empty module
- F3 Operator Search, which adds an empty module

## Requirements

- An active, selected armature in Pose mode.
- An Oriented armature in its hierarchy. Greyed out with "Requires an Oriented armature" otherwise.

## Usage

1. Select the bones the module should use, in Pose mode.
2. Pick a module type from **Add Rigging**, or press **+** and pick one in the **Rigging** dropdown.
3. Adjust the module in the Rigging Modules panel.

{% include media/screenshot.html alt="3D Viewport in Pose mode with the Pose > Add Rigging menu open listing the module types." %}

## Result

- A Rigging armature named after the original is created above the Oriented one, if there isn't one yet.
- A module is added to the list and made active.
- Setting a type populates the module's settings from the selection and builds it.

## Properties

### Set by the menu entry

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Rigging<br>`rigging_type` | Choice | Empty Module | **Empty Module**: Add a module without selecting its type<br>**Root Controls**: Add root motion rigging<br>**Spline Chain**: Add spline chain rigging<br>**Opposable Arm**: Add opposable arm rigging<br>**Plantigrade Leg**: Add plantigrade leg rigging<br>**Digitigrade Leg**: Add digitigrade leg rigging<br>**Scalar Chain**: Add scalar chain rigging<br>**Curl Chain**: Add curl chain rigging<br>**Twist Chain**: Add twist chain rigging<br>**Custom Bones**: Add custom bones from selection | The rigging module type to add.<br>*Hidden. Set by the Add Rigging menu entry.* |

## Limitations

- Module settings live on the module rather than the operator, so they aren't covered here.

## Related Operators

- [Set Oriented Armature]({% link docs/all-the-tools/orientation/set-oriented-armature.md %}): Creates the oriented armature this needs.
- [Remove Rigging Module]({% link docs/all-the-tools/rigging/remove-rigging-module.md %}): Removes a module this adds.
- [Move Rigging Module]({% link docs/all-the-tools/rigging/move-rigging-module.md %}): Reorders the list.
- [Copy Rigging]({% link docs/all-the-tools/rigging/copy-rigging.md %}): Copies modules onto another armature.
- [Rebuild Rigging]({% link docs/all-the-tools/rigging/rebuild-rigging.md %}): Rebuilds modules from their settings.

## Related Documentation

- Planned: the Rapid Rigging module guides.
