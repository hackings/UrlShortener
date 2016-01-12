require 'rails_helper'

module V1
  describe 'v1/short_urls/create', type: :view do

    describe 'v1/short_urls/create.json.rabl' do
      it 'renders short_url hash' do
        @short_url = FactoryGirl.create(:v1_short_url) 
        render template: 'v1/short_urls/create.json.rabl', format: :json
        view = JSON.parse(rendered).with_indifferent_access

        # The root object should be an hash
        expect( view.is_a?(Hash) ).to eq true

        # Model should have success and url and short keys
        expect( view.has_key?(:success) ).to eq true
        expect( view.has_key?(:url) ).to eq true
        expect( view.has_key?(:short) ).to eq true        
      end

    end
  end
end
