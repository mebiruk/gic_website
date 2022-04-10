class AddDisplayOnHomeToProgram < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :display_on_home, :boolean
  end
end
