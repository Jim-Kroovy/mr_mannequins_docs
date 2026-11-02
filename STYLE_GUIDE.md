# Documentation style guide

This covers the writing on the docs site. Page authoring steps are in the [README](README.md), and copy-ready pages are in [`_templates`](_templates).

## Audience

Assume the reader already knows Blender, Unreal and 3D work. Don't explain what an armature, constraint or action is unless Mr Mannequins treats it differently.

## Writing

- Be concise. Say what something does, how to use it and where it stops working.
- Use the exact names from the UI and source. Check them against `mr_mannequins_tools` rather than going from memory.
- Only document behaviour the source supports. If it's unclear, test it or leave it out.
- No marketing, filler or repetition.
- Write limitations plainly and put them in the Limitations section, not buried in a procedure. On operator pages they go in the introductory prose.

## Pages

- Start from the matching template and keep its headings and their order. Remove an optional section if it has nothing to say.
- Use numbered lists for procedures, with one action per step.
- Operator details live on the operator's page in All The Tools. Workflow, module and utility pages link to it instead of repeating it.
- Link between pages with `{% link %}` so a moved or unpublished target fails the build.
- A page is listed under its category by title, so every title on the site must be unique.

## Layout

- Open with a short introductory paragraph, then use descriptive headings. `#` is the page title, `##` the main sections and `###` their subsections.
- A workflow's Video section goes straight after its introductory description and before its first numbered step, because most readers will go to the video first.
- Workflow pages have no generic Requirements or Procedure sections. Each workflow step is its own `##` heading with its numbered steps directly under it.
- Alternate workflow steps share a number, like 1A and 1B. Put when to use each one directly below its heading, in parenthesized italics.
- Use compact lists for choices and related tools. Workflow pages don't use tables.
- Operator pages are flat: the `#` title, prose describing the operator, then a bullet list of its parameters. They have no subheadings, tables or media.
- Essential prerequisites, results, warnings and the operator's `bl_idname`, label and location live in that introductory prose, not in bold pseudo-headings or metadata bullets.
- Every bullet after the prose is a parameter, or a value set by a menu entry or button. Prefix a panel or group like `Meshes > Socket Suffices` where it helps, and indent choices or row fields under their parameter. An operator with no parameters ends after its prose. Write each one like this:

  ```markdown
  - **UI Name** (`identifier`) — Type; default and range or options. Description, then when it's available.
  ```

- Typography lives in `_sass/custom/custom.scss`: system fonts, a 46em reading width, 1.5 line height and bold headings at 2em, 1.5em, 1.25em and 1.125em for `#` to `####`. It only applies to page content, and the color scheme stays dark.

## Names and URLs

- Page titles use the name the UI uses, in title case.
- All The Tools operator titles use a clear action-and-object name, like **Load Template**, rather than an ambiguous single word.
- Documentation folders, Markdown filenames and permalink segments are lowercase `snake_case`. Titles stay in normal title case.
- Every page sets an explicit `permalink` in the form `/category/page_name/`. Operator pages use `/all_the_tools/category/operator_name/`.
- `{% link %}` tags use the underscore source path, like `docs/all_the_tools/category/operator_name.md`.
- Don't change a published permalink. Links and search results out in the wild depend on it.

## Media

- A written page must be complete without its media. Nothing gets explained only in a video or screenshot.
- Always use the `media/screenshot.html` and `media/youtube.html` includes. Don't write image or iframe markup by hand.
- Leave out `src` or `id` for a placeholder, and describe exactly what the finished media needs to show.
- Alt text and video titles describe what's shown, not just the name of the feature.
- Producing media is separate work. Don't hold back a page waiting for it.
