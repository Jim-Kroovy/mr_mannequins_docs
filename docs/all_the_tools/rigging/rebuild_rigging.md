---
title: Rebuild Rigging
parent: Rigging
grand_parent: All The Tools
nav_order: 5
permalink: /all_the_tools/rigging/rebuild_rigging/
---

# Rebuild Rigging

**Rebuild Rigging** (`mmt.rebuild`) rebuilds all rigging modules from their current settings. Every primary module and its mirrored counterpart are removed and rebuilt, and the list order is restored. Empty modules with no type are dropped, and it does nothing when the hierarchy has no Rigging armature. It's in the down arrow menu at `Properties > Armature > Rigging Modules` and in F3 Operator Search. It needs an active armature in Object or Pose mode, with an Oriented armature in its hierarchy. This operator has no settings.

{% include media/youtube.html title="Rebuilding every rigging module from the Rigging Modules down arrow menu after changing a module's settings" %}
