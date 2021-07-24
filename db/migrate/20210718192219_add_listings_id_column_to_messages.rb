class AddListingsIdColumnToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :listing_id, :string
  end
end
