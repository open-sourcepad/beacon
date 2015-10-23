class AddStateToAids < ActiveRecord::Migration
  def change
    add_column :aids, :state, :string, default: 'active'
  end
end
