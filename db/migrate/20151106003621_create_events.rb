class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :location
      t.time :time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
