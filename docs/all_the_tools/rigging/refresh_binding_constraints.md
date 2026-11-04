---
title: Refresh Binding Constraints
parent: Rigging
grand_parent: All The Tools
nav_order: 6
permalink: /all_the_tools/rigging/refresh_binding_constraints/
---

# Refresh Binding Constraints

**Refresh Binding Constraints** (`mmt.refresh`) refreshes Child Of constraints on oriented and original armatures. The original's constraints to the oriented armature are refreshed, and the oriented's constraints to the Rigging armature when there is one. It's at `Pose > Apply > Refresh Binding Constraints` and in F3 Operator Search. It needs an active armature with an Oriented armature in its hierarchy, and is greyed out with "Requires an Oriented armature" otherwise. This operator has no settings.

{% include media/youtube.html title="Running Refresh Binding Constraints from Pose > Apply and checking the Child Of constraints on the Original and Oriented bones" %}
