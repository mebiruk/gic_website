class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
    	t.string :training_name, null:false
    	t.string :study_level, null: false
    	t.text :overview
    	t.text :training_description
    	t.integer :training_duration
      t.decimal :total_tuition, default: 0.0
    	t.string :created_by
    	t.string :last_updated_by
      t.string :slug
      t.boolean :display_on_home
      t.timestamps
    end
  end
end
