class CreateProjectPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :project_positions do |t|
       t.belongs_to :project, index: true
       t.belongs_to :position, index: true
    end
  end
end
