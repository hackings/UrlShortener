class CreateV1ShortUrls < ActiveRecord::Migration
  def change
    create_table :v1_short_urls do |t|
      t.string :url
      t.string :short_url
      t.integer :visitor_count

      t.timestamps null: false
    end
  end
end
