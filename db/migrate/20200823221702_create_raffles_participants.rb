class CreateRafflesParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :raffles_participants do |t|
      t.string :full_name
      t.boolean :active, default: true
      t.boolean :winner, default: false
      t.boolean :special, default: false
      t.boolean :grand_winner, default: false
      t.boolean :second_grand_winner, default: false
      t.integer :position, default: 0
      t.timestamps
    end
  end
end
