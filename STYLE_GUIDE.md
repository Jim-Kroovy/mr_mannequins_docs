# Documentation style guide

This covers the writing on the docs site. Page authoring steps are in the [README](README.md), and copy-ready pages are in [`_templates`](_templates).

## Audience

Assume the reader already knows Blender, Unreal and 3D work. Don't explain what an armature, constraint or action is unless Mr Mannequins treats it differently.

## Writing

- Be concise. Say what something does, how to use it and where it stops working.
- Use the exact names from the UI and source. Check them against `mr_mannequins_tools` rather than going from memory.
- Only document behaviour the source supports. If it's unclear, test it or leave it out.
- No marketing, filler or repetition.
- Write limitations plainly and put them in the Limitations section, not buried in a procedure.

## Pages

- Start from the matching template and keep its headings and their order. Remove an optional section if it has nothing to say.
- Use numbered lists for procedures, with one action per step.
- Operator details live on the operator's page in All The Tools. Workflow, module and utility pages link to it instead of repeating it.
- Link between pages with `{% link %}` so a moved or unpublished target fails the build.
- A page is listed under its category by title, so every title on the site must be unique.

## Names and URLs

- Page titles use the name the UI uses, in title case.
- Every page sets an explicit `permalink` in the form `/category/page-name/`, lowercase and hyphenated.
- Don't change a published permalink. Links and search results out in the wild depend on it.

## Media

- A written page must be complete without its media. Nothing gets explained only in a video or screenshot.
- Always use the `media/screenshot.html` and `media/youtube.html` includes. Don't write image or iframe markup by hand.
- Leave out `src` or `id` for a placeholder, and describe exactly what the finished media needs to show.
- Alt text and video titles describe what's shown, not just the name of the feature.
- Producing media is separate work. Don't hold back a page waiting for it.
