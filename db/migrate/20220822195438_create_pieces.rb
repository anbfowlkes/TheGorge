class CreatePieces < ActiveRecord::Migration[7.0]
  def change
    create_table :pieces do |t|
      t.integer :level
      t.integer :h_pos
      t.integer :v_pos
      t.integer :player

      t.timestamps
    end
  end
end
