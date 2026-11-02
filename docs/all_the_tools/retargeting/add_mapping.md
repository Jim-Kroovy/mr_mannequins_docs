---
title: Add Mapping
parent: Retargeting
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/retargeting/add_mapping/
---

# Add Mapping

**Add Mapping** (`mmt.add_mapping`) adds a blank alternate name to the active bone's retargeting mapping, and copies the bone's retargeting settings across the Original, Oriented and Rigging tiers. It's the **+** on the Bone Mapping row at `3D Viewport > Sidebar > Item > Retargeting` and `Properties > Bone > Retargeting`, and it's in F3 Operator Search. It needs an active pose bone and an active armature in an Oriented hierarchy, and the panels themselves only show in Pose mode. Type the alternate source bone name into the new row.

A mapping is tried whenever the exact bone name isn't found, and the first entry that matches wins. Blank rows do nothing. This operator has no settings.
