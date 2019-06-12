class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.text :description
      t.integer :emotion_id

      t.timestamps
    end
  end
end
