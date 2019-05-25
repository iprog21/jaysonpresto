class CreateUserPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_positions do |t|
       t.belongs_to :user, index: true
       t.belongs_to :position, index: true
    end
  end
end
