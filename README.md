# mr_mannequins_docs
Official documentation for Mr Mannequins tools and workflows.

The site is built with [Jekyll](https://jekyllrb.com/) and [Just the Docs](https://just-the-docs.com/), and deployed to <https://jim-kroovy.github.io/mr_mannequins_docs/> by GitHub Pages. Writing standards are in [STYLE_GUIDE.md](STYLE_GUIDE.md).

## Building locally

Install Ruby 3.3 and Bundler. On Windows use [RubyInstaller](https://rubyinstaller.org/) with the DevKit, since some gems compile on install. Then, from the repository root:

```sh
bundle install
```

`_config.yml` sets the production `baseurl`, so local links match the live site. Serve at <http://127.0.0.1:4000/mr_mannequins_docs/>:

```sh
bundle exec jekyll serve
```

Run the same build as CI (CI passes the same `baseurl` on the command line):

```sh
JEKYLL_ENV=production bundle exec jekyll build --strict_front_matter
```

In PowerShell, run `$env:JEKYLL_ENV = "production"` first and leave it off the build command. The workflow in `.github/workflows/docs.yml` deploys every push to `main`, and can also be run manually from the Actions tab. The repository's Pages source must be set to `GitHub Actions`.

## Adding a page

1. Copy the matching file from `_templates` into its category folder under `docs`. Files in `_templates` are never built.
2. Set the front matter:
   - `title`: unique across the site, and the name shown in navigation.
   - `parent`: the exact title of the parent page. Top-level categories have no parent.
   - `nav_order`: the position among the page's siblings.
   - `permalink`: the stable public URL, such as `/all-the-tools/operator-name/`.
3. Replace the template text. Remove any links to pages that don't exist yet, because they fail the build.

## Coming Soon categories

Adding `coming_soon: true` to a page's front matter turns it into a grey, non-interactive navigation label. The page is left out of search, and all the pages below it are left unpublished.

To enable a category, remove that line. Nothing else needs to change.

This is handled by `_plugins/coming_soon.rb` and one branch in `_includes/components/nav/links.html`. That include is a copy of the theme's file, so compare it with the theme when bumping the `just-the-docs` version. Pages can't `{% link %}` to anything below a Coming Soon page, because that target isn't published.

## Links and media

Internal links use the source path, which adds the `baseurl` and fails the build if the target is missing:

```liquid
[Operator Name]({% link docs/all-the-tools/operator-name.md %})
```

Put images in `assets/images`, and pass paths without a leading slash:

```liquid
{% include media/screenshot.html src="assets/images/file.png" alt="What the image shows" caption="Optional caption" %}
```

Videos use the privacy-enhanced YouTube domain and scale with the page. `start` is optional, in seconds:

```liquid
{% include media/youtube.html id="VIDEO_ID" title="What the video shows" start="30" %}
```

Leave out `src` or `id` to show a placeholder that describes the missing media. For any other asset path, use `{{ "assets/file.zip" | relative_url }}` rather than writing the project path by hand.
