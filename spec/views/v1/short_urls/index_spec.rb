require 'rails_helper'

module V1
  describe 'v1/short_urls/index', type: :view do

    describe 'v1/short_urls/index.json.rabl' do
      it 'renders a list of short_urls' do
        @short_urls = [ FactoryGirl.create(:v1_short_url) ]
        render template: 'v1/short_urls/index.json.rabl', format: :json
        view = JSON.parse(rendered).with_indifferent_access

        # Should have a root object
        expect( view.has_key?(:urls) ).to eq true

        # The root object should be an Array
        expect( view[:urls].is_a?(Array) ).to eq true

        # Model should have success and url and short keys
        expect( view[:urls][0].has_key?(:success) ).to eq true
        expect( view[:urls][0].has_key?(:url) ).to eq true
        expect( view[:urls][0].has_key?(:short) ).to eq true        
      end

    end
  end
end
