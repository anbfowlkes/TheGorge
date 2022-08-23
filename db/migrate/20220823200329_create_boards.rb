class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.integer :game

      t.timestamps
    end
  end
end
