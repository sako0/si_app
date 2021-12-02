class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :title, null: false
      t.string :weekday, null: false
      t.integer :period, null: false
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
