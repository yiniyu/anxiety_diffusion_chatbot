class CreatePerspectives < ActiveRecord::Migration[5.1]
  def change
    create_table :perspectives do |t|
      t.string :name
      t.text :quotes
      t.integer :emotion_id

      t.timestamps
    end
  end
end
