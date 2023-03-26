class AddIsAllDayToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :is_all_day, :boolean
  end
end
