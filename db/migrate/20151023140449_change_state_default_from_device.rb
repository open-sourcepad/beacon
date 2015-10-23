class ChangeStateDefaultFromDevice < ActiveRecord::Migration
  def change
    change_column :devices, :state, :string, default: 'default'
  end
end
