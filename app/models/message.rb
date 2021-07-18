class Message < ActiveRecord::Base
    belongs_to :listings
    has_many :users, through: :listings
  
    validates :content, presence: true
end