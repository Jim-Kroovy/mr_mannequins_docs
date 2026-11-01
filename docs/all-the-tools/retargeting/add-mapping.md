---
title: Add Mapping
parent: Retargeting
grand_parent: All The Tools
nav_order: 1
permalink: /all-the-tools/retargeting/add-mapping/
---

# Add Mapping

**Operator:** `mmt.add_mapping`  
**Label:** Add Mapping

Adds a blank alternate name to the active bone's retargeting mapping.

## Location

- `3D Viewport > Sidebar > Item > Retargeting`, the **+** on the Bone Mapping row
- `Properties > Bone > Retargeting`, the **+** on the Bone Mapping row
- F3 Operator Search

## Requirements

- An active pose bone.
- An active armature in an Oriented hierarchy. The panels themselves only show in Pose mode.

## Usage

1. Make the bone active in Pose mode.
2. Press **+** on the Bone Mapping row.
3. Type the alternate source bone name into the new row.

{% include media/screenshot.html alt="3D Viewport sidebar Item tab in Pose mode, with the Retargeting panel showing the Bone Mapping row and two mapping entries." %}

## Result

- A blank row is added, and the bone's retargeting settings are copied across the Original, Oriented and Rigging tiers.

## Properties

This operator has no settings.

## Limitations

- A mapping is tried whenever the exact bone name isn't found. The first entry that matches wins.
- Blank rows do nothing.

## Related Operators

- [Remove Mapping]({% link docs/all-the-tools/retargeting/remove-mapping.md %}): Removes a row this adds.
- [Retarget Pose]({% link docs/all-the-tools/retargeting/retarget-pose.md %}): Resolves differently named bones through these mappings.
- [Retarget]({% link docs/all-the-tools/retargeting/retarget.md %}): Resolves differently named bones through these mappings.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
