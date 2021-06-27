class Listing < ActiveRecord::Base
    belongs_to :user
    has_many :photos
  
    validates :content, presence: true
end