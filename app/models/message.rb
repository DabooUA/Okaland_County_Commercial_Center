class Message < ActiveRecord::Base
    belongs_to :listings
    belongs_to :users
    # has_many :users, through: :listings
  
    validates :content, presence: true
end