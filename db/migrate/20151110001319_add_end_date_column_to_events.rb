class AddEndDateColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end_date, :string
  end
end
