---
title: Decimate Keyframes
parent: Retargeting
grand_parent: All The Tools
nav_order: 2
permalink: /all_the_tools/retargeting/decimate_keyframes/
---

# Decimate Keyframes

**Decimate Keyframes** (`mmt.fcurve`) reduces the selected f-curves to the fewest keyframes that still fit their original shape within a margin of error, using Blender's own curve fitting decimate, optionally followed by a pass thinning out any keys still clustered too close together. It's at `Dope Sheet > Key > Decimate Keyframes` and in F3 Operator Search. It needs selected f-curves, and there's no `poll()` check.

Blender's `graph.decimate` runs in Error Margin mode. With **Thin Spacing** above 0, the selected curves are grouped by bone, or all editable curves when none are selected, and every curve in a group ends up keyed on the same frames, at least that far apart. When keys are closer together than that, thinning keeps whichever one deviates most from a straight line between its neighbours, and a curve's first and last keys are never beaten.

It borrows a Dope Sheet or Graph Editor area in the window, temporarily switching another area over when there isn't one. The top bar and status bar are never used, and it does nothing if no area is available.

- **Error Margin** (`margin`) — Float; default 0.01; min 0. How much the decimated curve is allowed to deviate from the original.
- **Thin Spacing** (`spacing`) — Integer; default 4; min 0. Minimum space keys can have when thinning, 0 to disable thinning entirely.
