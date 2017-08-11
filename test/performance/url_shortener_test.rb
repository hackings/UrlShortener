require 'test_helper'
require 'rails/performance_test_help'

class UrlShortenerTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  self.profile_options = { runs: 5 }

  test "create" do
    post 'http://localhost:3000/v1/short_urls', :short_url => { :url => 'abcd.com/xyz/123' }
  end

  test "list" do
    get 'http://localhost:3000/v1/short_urls'
  end

end
