object @short_url
node(:success) { true }
attributes :url
node(:count) { @short_url.visitor_count }