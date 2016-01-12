require "rails_helper"

RSpec.describe V1::ShortUrlsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/short_urls").to route_to("v1/short_urls#index")
    end

    it "routes to #new" do
      expect(:get => "/v1/short_urls/new").to route_to("v1/short_urls#new")
    end

    it "routes to #show" do
      expect(:get => "/v1/short_urls/1").to route_to("v1/short_urls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/v1/short_urls/1/edit").to route_to("v1/short_urls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/v1/short_urls").to route_to("v1/short_urls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/short_urls/1").to route_to("v1/short_urls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/short_urls/1").to route_to("v1/short_urls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/short_urls/1").to route_to("v1/short_urls#destroy", :id => "1")
    end

  end
end
