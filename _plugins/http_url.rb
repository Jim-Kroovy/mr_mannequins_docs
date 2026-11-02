require "uri"

# only absolute http(s) addresses with a real host pass, footer links use this...
module HttpUrl
  def is_http_url(url)
    uri = URI.parse(url.to_s)
    uri.is_a?(URI::HTTP) && uri.userinfo.nil? && uri.host.to_s.match?(/\A[a-z0-9-]+(\.[a-z0-9-]+)+\z/i)
  rescue URI::Error
    false
  end
end

Liquid::Template.register_filter(HttpUrl)
