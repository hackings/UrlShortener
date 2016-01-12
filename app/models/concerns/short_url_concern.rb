module ShortUrlConcern
  extend ActiveSupport::Concern

  BASE_SHORT_URL = 'http://tt.co/'

  included do
    after_create :update_short_url

    validates_presence_of :url

  private
    # Prepares the object before save
    def update_short_url
      uniq_key = Digest::MD5.hexdigest("#{self.id()}").slice(0..6) 
      update_column(:short_url, BASE_SHORT_URL + uniq_key)
      true
    end   

  end
end
