class CreateTrainingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :training_lists do |t|
      t.belongs_to :training, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
