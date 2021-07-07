class Listing < ActiveRecord::Base
    belongs_to :user
    has_many :photos
    has_many :message
  
    validates :content, presence: true
end