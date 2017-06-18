class AddStatusToEnrolls < ActiveRecord::Migration[5.1]
  def change
    add_column :enrolls, :status, :boolean
  end
end
