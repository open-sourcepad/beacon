class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_id, null: false
      t.string :state, default: 'okay'
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.timestamps
    end
  end
end
