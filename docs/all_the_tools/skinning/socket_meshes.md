---
title: Socket Meshes
parent: Skinning
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/skinning/socket_meshes/
---

# Socket Meshes

**Socket Meshes** (`mmt.socket`) attaches single weighted skeletal meshes to their armature to make them correctly oriented socket meshes, or detaches them back to skeletal meshes. It's at `Object > Apply > Socket Meshes` and `Object > Apply > Unsocket Meshes`, and in F3 Operator Search, which uses Socket. Meshes that don't qualify are skipped with no message. Armatures sit in rest position while this runs, then go back to pose position.

{% include media/youtube.html title="Converting a prop weighted to one bone into a socket mesh with Socket Meshes, then back into a skeletal mesh with Unsocket Meshes" %}

**Socket** needs selected visible meshes with an armature modifier, and exactly one vertex group with weight that matches a bone. The armature modifiers and that vertex group are removed. The mesh's origin moves to the bone's head and it's parented to the bone, with its rotation applied.

**Unsocket** needs selected visible meshes parented to a bone. All vertices get full weight in a group named after the bone, an armature modifier is added, the parenting is cleared, and location and rotation are applied. Scale isn't. A name that already ends with the bone name doesn't get it again.

- **Mode** (`mode`) — Choice; default Socket. Whether to socket or unsocket the selected meshes. Set by the menu entry.
  - **Socket** (`SOCKET`): This is **Socket Meshes**.
  - **Unsocket** (`UNSOCKET`): This is **Unsocket Meshes**.
- **Suffices** (`suffices`) — Checkbox; default Off. Add or strip the parent bone's name as a suffix on the mesh name. Labelled Add Suffices on Socket and Remove Suffices on Unsocket. Off from the menu.
