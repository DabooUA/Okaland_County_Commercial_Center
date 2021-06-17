class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |m|
      m.string :user_id
      m.string :content
    end
  end
end
