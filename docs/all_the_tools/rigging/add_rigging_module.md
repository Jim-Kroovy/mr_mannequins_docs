---
title: Add Rigging Module
parent: Rigging
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/rigging/add_rigging_module/
---

# Add Rigging Module

**Add Rigging Module** (`mmt.add`) adds an empty rigging module. Pick its type in the Rigging dropdown to build it, or pick a type straight from the Add Rigging menu. It's at `Pose > Add Rigging`, then a module type, and `Shift + A` in Pose mode opens the same menu. The **+** button at `Properties > Armature > Rigging Modules` and F3 Operator Search both add an empty module.

{% include media/youtube.html title="Adding rigging modules: selecting bones on the Oriented armature and picking a type from Pose > Add Rigging, then adding an empty module with the + button and picking its type" %}

It needs an active, selected armature in Pose mode, with an Oriented armature in its hierarchy, and is greyed out with "Requires an Oriented armature" otherwise. [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}) creates one. Select the bones the module should use first.

A Rigging armature named after the original is created above the Oriented one, if there isn't one yet. A module is added to the list and made active, and setting a type populates the module's settings from the selection and builds it. Module settings live on the module rather than the operator, so they aren't covered here.

- **Rigging** (`rigging_type`) — Choice; default empty Module. The rigging module type to add. Hidden. Set by the Add Rigging menu entry.
  - **Empty Module**: Add a module without selecting its type
  - **Root Controls**: Add root motion rigging
  - **Spline Chain**: Add spline chain rigging
  - **Opposable Arm**: Add opposable arm rigging
  - **Plantigrade Leg**: Add plantigrade leg rigging
  - **Digitigrade Leg**: Add digitigrade leg rigging
  - **Scalar Chain**: Add scalar chain rigging
  - **Curl Chain**: Add curl chain rigging
  - **Twist Chain**: Add twist chain rigging
  - **Custom Bones**: Add custom bones from selection
