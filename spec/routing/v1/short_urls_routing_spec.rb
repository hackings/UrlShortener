require "rails_helper"

RSpec.describe V1::ShortUrlsController, type: :routing do
  describe "routing" do
    let(:version) { "v1" }
    let(:short_url) { FactoryGirl.create(:v1_short_url) }

    it "routes v1/short_urls to short_urls#index" do
      expect(:get => "/#{version}/short_urls").to route_to(
        :controller => "#{version}/short_urls", :action => "index", :format => :json ) 
    end

    it "routes v1/short_urls/:id to #show" do
      expect(:get => "/#{version}/short_urls/#{short_url.id}").to route_to(
        :controller => "#{version}/short_urls", :action => "show", :id => short_url.id.to_s, :format => :json
        )
    end

    it "routes v1/short_urls to #create" do
      expect(:post => "/#{version}/short_urls").to route_to(
        :controller => "#{version}/short_urls", :action => "create", :format => :json
        )
    end

  end
end
