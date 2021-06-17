class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |v|
      v.string :year
      v.string :make
      v.string :model
      v.string :miles
      v.string :engine
    end
  end
end
