object false
collection @short_urls => :urls
node(:success) { true }
attributes :url
node(:short) { |short_url| short_url.short_url }
