require 'rails_helper'

RSpec.describe V1::ShortUrl, type: :model do
  it { 
  	#Validations
  	should validate_presence_of( :url )
  }

  #Instance Methods
  it "should return `short_url` after create" do 
  	short_url = FactoryGirl.create(:v1_short_url)
  	uniq_key = Digest::MD5.hexdigest("#{short_url.id()}").slice(0..6) 
  	expect(short_url.short_url).to eq( ShortUrlConcern::BASE_SHORT_URL + uniq_key )
  end  	
  
end
