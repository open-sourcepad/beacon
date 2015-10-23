class CreateAids < ActiveRecord::Migration
  def change
    create_table :aids do |t|
      t.string :criminal_id
      t.string :recipient_id
      t.timestamps
    end
  end
end
