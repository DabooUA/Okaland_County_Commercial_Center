class AddAttachmentColumnToListings < ActiveRecord::Migration
  def change
    add_attachment :listings, :photos
  end
end
