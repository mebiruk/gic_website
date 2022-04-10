class AddDepartmentToPrograms < ActiveRecord::Migration[5.2]
  def change
    add_reference :programs, :department, foreign_key: true
  end
end
