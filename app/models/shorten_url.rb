class ShortenUrl < ApplicationRecord
  validates_presence_of :original_url
  validates :original_url, url: true
  
end
