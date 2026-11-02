---
title: Making Socket Meshes
parent: Ultimate Workflows
nav_order: 4
permalink: /ultimate_workflows/making_socket_meshes/
---

# Making Socket Meshes

Turn rigid props and armor into meshes parented to a single bone, export each one to its own FBX, then optionally attach them to a character in Unreal Engine.

You need a character with an Original armature first. [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %}) covers getting one.

## Video

{% include media/youtube.html title="Making socket meshes from start to finish: preparing a prop mesh, weighting it to one bone on the Original armature, converting it with Socket Meshes, exporting it to its own FBX and attaching it to a Skeletal Mesh component in Unreal Engine" %}

## 1. Prepare Mesh Geometry

1. Keep the armature at the world origin with no rotation, since Socket reads bone positions as though it has no object transform.
2. Position each mesh where it should sit against its bone in the armature's rest pose.
3. Keep each socket as its own mesh object.
4. Apply the location, rotation and scale with `Object > Apply > All Transforms`.

Applying matters for two of those:

- **Rotation:** Socket replaces the object's rotation, so a rotation that isn't applied first moves the mesh.
- **Scale:** Socket leaves it alone, but the export resets it, so a scale that isn't applied first changes the size in the file.

{% include media/screenshot.html alt="3D Viewport in Object mode with a prop mesh positioned against a hand bone in rest pose, and the Object > Apply menu open on All Transforms" %}

## 2. Assign Bone Weights

1. Add an Armature modifier to the mesh, pointing at the character's Original armature.
2. Give the mesh one vertex group named after the bone it attaches to, with any weight above zero. Use [Weight Meshes]({% link docs/all_the_tools/skinning/weight_meshes.md %}) or Blender's own weight painting.

Use the Original because it's the skeleton that gets exported, so the mesh takes on the transform of the bone it'll follow at the destination. The operator doesn't check which armature you pointed it at.

The weights only pick the bone. How they're spread doesn't change anything, because the whole mesh ends up rigidly attached to that bone. If the first valid Armature modifier's armature has more than one bone with weight on the mesh, the mesh is skipped. Zero weight groups and groups that don't match a bone don't count.

{% include media/screenshot.html alt="Properties editor Object Data tab showing a single vertex group named after the hand bone, beside the Modifiers tab with an Armature modifier pointing at the Original armature" %}

## 3. Create Socket Meshes

1. Select the meshes in Object mode.
2. Open `Object > Apply > Socket Meshes`. See [Socket Meshes]({% link docs/all_the_tools/skinning/socket_meshes.md %}).
3. Turn on **Add Suffices** in the redo panel if you want the bone name added to the object's name. It's off by default.

Each mesh that qualifies loses its Armature modifiers and that vertex group, and its other vertex groups stay. Its origin moves to the bone's head and it's parented to the bone. Your selection, active object and mode come back afterwards.

Meshes that don't qualify are skipped with no message, so check the result:

1. Each mesh's **Parent Type** is Bone, with the right **Parent Bone**.
2. Its origin is at the bone's head, and its rotation is zero.
3. It's still in the same place in the rest pose.
4. It follows the bone rigidly when you pose the character.

To edit one again, use `Object > Apply > Unsocket Meshes`, which puts it back to a fully weighted skeletal mesh.

{% include media/screenshot.html alt="3D Viewport with the converted prop selected and its origin on the bone's head, beside the Object Properties Relations panel showing Parent Type Bone and the Socket Meshes redo panel with Add Suffices" %}

## 4. Export Socket Meshes

1. Select the socket meshes. **Only Selected** is on by default, and selecting a socket mesh also finds its armature.
2. Open `File > Export > Mr Mannequins FBX (.fbx)`. See [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %}).
3. Pick a folder in the file browser. The file name you type is ignored, because names come from the meshes.
4. In the Meshes panel, leave **Export** and **Socket Meshes** on. **Folder** puts the files in a subfolder if you want one.
5. In the Actions panel, turn **Export** off if you only want the meshes.
6. Leave **Background Export** on in the Advanced panel, so your open file isn't changed.
7. Confirm the export.

Every socket mesh gets its own FBX whatever **Batch Export** is set to, written from the origin with its transforms cleared.

**Socket Suffices** is on by default and adds `_<bone>` to the file name, so `Prop` on the `hand` bone writes `Prop_hand.fbx`. A name already ending in `_<bone>` doesn't get it twice, and the object itself isn't renamed. This is separate from **Add Suffices** in step 3, which renames the object. Any run of characters that aren't letters or numbers becomes an underscore in the file name.

{% include media/screenshot.html alt="Blender file browser in File > Export > Mr Mannequins FBX with the Meshes panel open showing Socket Meshes and Socket Suffices on, and the socket meshes selected in the scene" %}

## 5. Optional: Import into Unreal Engine

This step only applies if Unreal Engine is where the character is going. The add-on doesn't create Skeleton sockets or Blueprint components, so this is all done in Unreal.

1. Import each FBX as a Static Mesh.
2. Open the character's Blueprint and add a Static Mesh component using that mesh.
3. Parent it to the character's Skeletal Mesh component in the Components panel.
4. Set **Parent Socket** in the Details panel to the bone or to an existing Skeleton socket.
5. Check the relative transform, orientation and scale in the Blueprint viewport, then check that it follows the animation in play mode.

Import option names and other settings can vary, so check them in your version of Unreal Engine.

{% include media/screenshot.html alt="Unreal Engine Blueprint editor with a Static Mesh component parented to the character's Skeletal Mesh component, and the Details panel showing Parent Socket set to the hand bone" %}

## Limitations

- **Skipped meshes get no message.** That covers hidden, unselected and non-mesh objects, meshes with no valid Armature modifier, and meshes with no weighted bone group or more than one.
- **Socket meshes are rigid.** A mesh follows one bone and nothing else, so it can't deform across several.
- **A moved armature moves the mesh.** Socket doesn't account for the armature's object transform, so a moved or rotated armature puts the mesh in the wrong place.
- **Rest Position doesn't stick.** Armatures go back to Pose Position afterwards, even if they were in Rest Position before.

## Related

### Related Workflows

- [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %}): importing a character and creating its Oriented armature.
- [Retargeting Armatures]({% link docs/ultimate_workflows/retargeting_armatures.md %}): what happens to socket meshes when a character is adapted to another one.

### Related Operators

- [Weight Meshes]({% link docs/all_the_tools/skinning/weight_meshes.md %})
- [Socket Meshes]({% link docs/all_the_tools/skinning/socket_meshes.md %})
- [Export Mr Mannequins FBX]({% link docs/all_the_tools/exporting/export_mr_mannequins_fbx.md %})
