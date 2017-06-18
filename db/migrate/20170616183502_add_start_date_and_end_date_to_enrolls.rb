class AddStartDateAndEndDateToEnrolls < ActiveRecord::Migration[5.1]
  def change
    add_column :enrolls, :start_date, :datetime
    add_column :enrolls, :end_date, :datetime
  end
end
