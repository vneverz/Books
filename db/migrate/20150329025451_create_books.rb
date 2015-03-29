class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :bio
      t.date :release

      t.timestamps null: false
    end
  end
end
