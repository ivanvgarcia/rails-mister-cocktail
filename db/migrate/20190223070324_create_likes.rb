class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.references :cocktail, foreign_key: true

      t.timestamps
    end
  end
end
