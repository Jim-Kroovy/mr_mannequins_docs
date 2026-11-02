---
title: Rapid Rigging
nav_order: 2
permalink: /rapid_rigging/
---

# Rapid Rigging

Rapid Rigging builds an animation rig out of modules. Each one takes a selection of bones on a character's Oriented armature and adds the controls for that body part to a separate Rigging armature, which then drives the character.

You need an Oriented armature first, and [Set Oriented Armature]({% link docs/all_the_tools/orientation/set_oriented_armature.md %}) creates one. For one full biped from start to finish, see [Custom Character Setup]({% link docs/ultimate_workflows/custom_character_setup.md %}).

## Modules

- [Root Controls]({% link docs/rapid_rigging/root_controls.md %}): the character's root control, with optional followers.
- [Spline Chain]({% link docs/rapid_rigging/spline_chain.md %}): three or more bones along a curve, such as a spine.
- [Opposable Arm]({% link docs/rapid_rigging/opposable_arm.md %}): IK and a pole for an arm.
- [Plantigrade Leg]({% link docs/rapid_rigging/plantigrade_leg.md %}): IK, a pole and a foot roll for a flat footed leg.
- [Digitigrade Leg]({% link docs/rapid_rigging/digitigrade_leg.md %}): IK and a pole for a leg that stands on its toes.
- [Scalar Chain]({% link docs/rapid_rigging/scalar_chain.md %}): two or more bones reaching for one stretchy IK target.
- [Curl Chain]({% link docs/rapid_rigging/curl_chain.md %}): one control that curls two or more bones, such as a finger.
- [Twist Chain]({% link docs/rapid_rigging/twist_chain.md %}): twist bones that follow another bone's twist.
- [Custom Bones]({% link docs/rapid_rigging/custom_bones.md %}): plain controls for anything else.

## How Modules Work

Add modules from `Pose > Add Rigging` or `Shift + A`, with the Oriented armature's bones selected. See [Add Rigging Module]({% link docs/all_the_tools/rigging/add_rigging_module.md %}). The Rigging armature becomes active afterwards, but keep selecting on the Oriented armature, because modules only read bones from there.

Each module is an entry in `Properties > Armature > Rigging Modules`, with its settings below the list in Pose mode. Changing a setting rebuilds that module straight away. [Rebuild Rigging]({% link docs/all_the_tools/rigging/rebuild_rigging.md %}) rebuilds all of them, [Copy Rigging]({% link docs/all_the_tools/rigging/copy_rigging.md %}) moves them to another armature, and [Remove Rigging Module]({% link docs/all_the_tools/rigging/remove_rigging_module.md %}) and [Move Rigging Module]({% link docs/all_the_tools/rigging/move_rigging_module.md %}) manage the list.

Modules connect through shared bones. A chain's first bone parent becomes its **Origin**, so an arm picks up the spine's bone and fingers pick up the hand. Add modules from the middle of the body outwards, with [Twist Chain]({% link docs/rapid_rigging/twist_chain.md %}) last.

## Limitations

- **Don't give the same chain bone to two modules.** Nothing stops you, and the list ends up with two entries for it, so sharing is only for origins and endings.
