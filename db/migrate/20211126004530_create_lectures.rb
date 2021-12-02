class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
