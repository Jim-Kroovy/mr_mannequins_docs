---
title: Remove Mapping
parent: Retargeting
grand_parent: All The Tools
nav_order: 3
permalink: /all_the_tools/retargeting/remove_mapping/
---

# Remove Mapping

**Remove Mapping** (`mmt.remove_mapping`) removes an alternate name from the active bone's retargeting mapping, and copies the bone's retargeting settings across the Original, Oriented and Rigging tiers. It's the **X** on a mapping row at `3D Viewport > Sidebar > Item > Retargeting` and `Properties > Bone > Retargeting`, and it's in F3 Operator Search. It needs an active pose bone and an active armature in an Oriented hierarchy, and the panels themselves only show in Pose mode. From F3 it uses the default index, so it targets the first row. Use the row buttons when you can.

{% include media/youtube.html title="Removing an alternate bone name with the X button on its mapping row in the Sidebar Retargeting panel" %}

- **index** (`index`) — Integer; default 0; unbounded. The mapping row to remove. Set by the row's X button.
