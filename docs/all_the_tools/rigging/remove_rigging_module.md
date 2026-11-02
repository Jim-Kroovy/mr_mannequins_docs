---
title: Remove Rigging Module
parent: Rigging
grand_parent: All The Tools
nav_order: 7
permalink: /all_the_tools/rigging/remove_rigging_module/
---

# Remove Rigging Module

**Remove Rigging Module** (`mmt.remove`) removes a rigging module, deleting the bones and constraints it created. Shared origin and ending bones are kept, and so is a bone also used by another module. It's the **-** button at `Properties > Armature > Rigging Modules`, and it's in F3 Operator Search. It needs an active, selected Oriented or Rigging armature in Pose mode, with a Rigging armature and a valid active module.

A built module's own bones, drivers and constraints are removed, along with the constraints it drives on the Oriented armature. An empty module is just dropped from the list. Removing the last module also removes the Rigging armature, and goes back to the Oriented armature in Pose mode. This operator has no settings.
