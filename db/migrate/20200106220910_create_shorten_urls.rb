class CreateShortenUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shorten_urls do |t|
      t.text :original_url
      t.string :little_url

      t.timestamps
    end
  end
end
