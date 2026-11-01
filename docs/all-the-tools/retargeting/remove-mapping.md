---
title: Remove Mapping
parent: Retargeting
grand_parent: All The Tools
nav_order: 3
permalink: /all-the-tools/retargeting/remove-mapping/
---

# Remove Mapping

**Operator:** `mmt.remove_mapping`  
**Label:** Remove Mapping

Removes an alternate name from the active bone's retargeting mapping.

## Location

- `3D Viewport > Sidebar > Item > Retargeting`, the **X** on a mapping row
- `Properties > Bone > Retargeting`, the **X** on a mapping row
- F3 Operator Search

## Requirements

- An active pose bone.
- An active armature in an Oriented hierarchy. The panels themselves only show in Pose mode.

## Usage

1. Make the bone active in Pose mode.
2. Press **X** on the mapping row to remove.

## Result

- The row is removed, and the bone's retargeting settings are copied across the Original, Oriented and Rigging tiers.

## Properties

### Button value

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| index<br>`index` | Integer | 0 | Unbounded | The mapping row to remove.<br>*Set by the row's X button.* |

## Limitations

- From F3 it uses the default index, so it targets the first row. Use the row buttons when you can.

## Related Operators

- [Add Mapping]({% link docs/all-the-tools/retargeting/add-mapping.md %}): Adds the rows this removes.
- [Retarget Pose]({% link docs/all-the-tools/retargeting/retarget-pose.md %}): Resolves differently named bones through these mappings.
- [Retarget]({% link docs/all-the-tools/retargeting/retarget.md %}): Resolves differently named bones through these mappings.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
