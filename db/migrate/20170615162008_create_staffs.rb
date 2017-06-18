class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :code
      t.string :department

      t.timestamps
    end
  end
end
