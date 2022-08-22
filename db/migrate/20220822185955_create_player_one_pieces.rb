class CreatePlayerOnePieces < ActiveRecord::Migration[7.0]
  def change
    create_table :player_one_pieces do |t|
      t.integer :variant
      t.integer :position

      t.timestamps
    end
  end
end
