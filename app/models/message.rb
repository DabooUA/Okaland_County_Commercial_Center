class Message < ActiveRecord::Base
    belongs_to :listing
    belongs_to :user
 
    validates :content, presence: true
end