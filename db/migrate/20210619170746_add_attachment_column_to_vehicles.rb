class AddAttachmentColumnToVehicles < ActiveRecord::Migration
  def change
    add_attachment :vehicles, :photo
  end
end
