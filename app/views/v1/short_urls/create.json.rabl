object @short_url
node(:success) { true }
attributes :url
node(:short) { @short_url.short_url }