FactoryGirl.define do
  factory :v1_short_url, :class => 'V1::ShortUrl' do
    url "MyString"
short_url "MyString"
visitor_count 1
  end

end
