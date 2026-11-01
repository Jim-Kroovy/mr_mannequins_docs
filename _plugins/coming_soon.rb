# coming_soon: true in a page's front matter is the only switch for this...
# the page stays as a nav label (see _includes/components/nav/links.html) but leaves search...
# and everything below it doesn't get published at all, so it can't reach nav or search...
Jekyll::Hooks.register :site, :post_read do |site|
  soon = site.pages.select { |p| p.data["coming_soon"] == true }
  soon.each { |p| p.data["search_exclude"] = true }

  # walk down the tree, parents are matched by title like the theme does...
  titles = soon.map { |p| p.data["title"] }
  hidden = []
  loop do
    found = site.pages.select { |p| titles.include?(p.data["parent"]) } - hidden - soon
    break if found.empty?
    hidden += found
    titles += found.map { |p| p.data["title"] }
  end
  site.pages -= hidden
end
