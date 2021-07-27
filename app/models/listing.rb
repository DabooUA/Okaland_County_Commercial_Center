class Listing < ActiveRecord::Base
    belongs_to :user
    has_many :messages
  
    validates :content, presence: true
end