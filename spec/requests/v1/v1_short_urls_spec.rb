require 'rails_helper'

RSpec.describe "V1::ShortUrls", type: :request do
  describe "GET /v1_short_urls" do
    it "works! (now write some real specs)" do
      get v1_short_urls_path
      expect(response).to have_http_status(200)
    end
  end
end
