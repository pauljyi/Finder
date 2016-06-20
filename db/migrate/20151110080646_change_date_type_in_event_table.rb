class ChangeDateTypeInEventTable < ActiveRecord::Migration
  def change
      remove_column :events, :start_date
      add_column :events, :start_date, :date
      remove_column :events, :end_date
      add_column :events, :end_date, :date
  end
end
