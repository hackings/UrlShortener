require 'rails_helper'

RSpec.describe "V1::ShortUrls", type: :request do
  describe "GET /v1_short_urls" do
    it "should return status 200/OK" do
      get v1_short_urls_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /v1_short_urls/:id" do
    it "should return status 200/OK" do
      v1_short_url = FactoryGirl.create(:v1_short_url)	
      get v1_short_urls_path(v1_short_url)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /v1_short_urls" do
    it "should return status 200/OK for valid attributes" do
      post v1_short_urls_path, short_url: { url: 'http://abc.com' }
      expect(response).to have_http_status(200)
    end

    it "should return status 400/OK for invalid attributes" do
      post v1_short_urls_path, short_url: { }
      expect(response).to have_http_status(400)
    end

  end

end
