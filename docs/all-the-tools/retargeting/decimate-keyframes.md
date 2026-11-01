---
title: Decimate Keyframes
parent: Retargeting
grand_parent: All The Tools
nav_order: 2
permalink: /all-the-tools/retargeting/decimate-keyframes/
---

# Decimate Keyframes

**Operator:** `mmt.fcurve`  
**Label:** Decimate Keyframes

Reduces the selected f-curves to the fewest keyframes that still fit their original shape within a margin of error, using Blender's own curve fitting decimate, optionally followed by a pass thinning out any keys still clustered too close together.

## Location

- `Dope Sheet > Key > Decimate Keyframes`
- F3 Operator Search

## Requirements

- Selected f-curves. There's no `poll()` check.

## Usage

1. Select the channels to clean.
2. Run the operator.
3. Adjust **Error Margin** and **Thin Spacing** in the redo panel.

{% include media/screenshot.html alt="Dope Sheet with the Key menu open and Decimate Keyframes highlighted, with several channels selected." %}

## Result

- Blender's `graph.decimate` runs in Error Margin mode.
- With **Thin Spacing** above 0, the selected curves are grouped by bone, or all editable curves when none are selected. Every curve in a group ends up keyed on the same frames, at least that far apart.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Error Margin<br>`margin` | Float | 0.01 | Min 0 | How much the decimated curve is allowed to deviate from the original. |
| Thin Spacing<br>`spacing` | Integer | 4 | Min 0 | Minimum space keys can have when thinning, 0 to disable thinning entirely.<br>*0 turns thinning off.* |

## Limitations

- When keys are closer together than **Thin Spacing**, thinning keeps whichever one deviates most from a straight line between its neighbours. A curve's first and last keys are never beaten.
- It borrows a Dope Sheet or Graph Editor area in the window, temporarily switching another area over when there isn't one. The top bar and status bar are never used. It does nothing if no area is available.

## Related Operators

- [Import Mr Mannequins FBX]({% link docs/all-the-tools/importing/import-mr-mannequins-fbx.md %}): Offers the same pass in its Cleaning panel, including after retargeting.

## Related Documentation

- Planned: an Ultimate Workflows guide covering this operator.
