class CreateEnrolls < ActiveRecord::Migration[5.1]
  def change
    create_table :enrolls do |t|
      t.belongs_to :staff, index: true
      t.belongs_to :device, index: true

      t.timestamps
    end
  end
end
