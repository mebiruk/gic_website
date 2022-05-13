class AddIndexToTraining < ActiveRecord::Migration[5.2]
  def change
    add_index :trainings, :slug, unique: true
  end
end
