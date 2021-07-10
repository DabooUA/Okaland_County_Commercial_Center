class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |l|
      l.string :user_id
      l.string :title
      l.string :year
      l.string :make
      l.string :model
      l.string :miles
      l.string :engine
      l.string :content
    end
  end
end
