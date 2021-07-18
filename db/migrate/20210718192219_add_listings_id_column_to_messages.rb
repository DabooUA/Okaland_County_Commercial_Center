class AddListingsIdColumnToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :listings_id, :string
  end
end
