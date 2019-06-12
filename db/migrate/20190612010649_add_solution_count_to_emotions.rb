class AddSolutionCountToEmotions < ActiveRecord::Migration[5.1]
  def change
    add_column :emotions, :solutions_count, :integer
  end
end
