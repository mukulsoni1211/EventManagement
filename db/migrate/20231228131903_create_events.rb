class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :desc
      t.datetime :start_time
      t.datetime :end_time
      t.integer :total_ticket
      t.integer :remaining_ticket
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
