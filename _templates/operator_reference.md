---
title: Operator Name
parent: Category Name
grand_parent: All The Tools
nav_order: 1
permalink: /all_the_tools/category_name/operator_name/
---

# Operator Name

**Operator:** `mmt.operator_name`  
**Label:** Exact `bl_label`

What this operator does, in a sentence or two.

## Location

- Exact menu path or panel, and the mode it's in.
- F3 Operator Search

## Requirements

- What `poll()` needs, and the mode, selection or data the operator reads.

## Usage

1. One action per step, using the exact UI name.

{% include media/screenshot.html alt="The Blender area, mode, selection and visible controls the finished screenshot needs to show" %}

## Result

- What changes once it has run, including anything it creates, renames, stashes or removes.

## Properties

### Redo panel

| Setting | Type | Default | Range or choices | Description |
| ------- | ---- | ------- | ---------------- | ----------- |
| Exact UI name<br>`identifier` | Checkbox | Off | | Source description.<br>*When it's available.* |

Use one subsection per panel, dialog or nested group, in the order they're drawn. If there are no settings, say so.

## Variants

### Mode

- What each menu entry or mode does. Leave this section out if there aren't any.

## Limitations

- Warnings, side effects, validation and where the operator stops working. Leave this section out if there aren't any.

## Related Operators

- [Other Operator]({% link docs/all_the_tools/category_name/other_operator.md %}): How it relates, when that isn't obvious.

## Related Documentation

- Link pages that are published. Write anything planned as plain text, starting with "Planned:".
