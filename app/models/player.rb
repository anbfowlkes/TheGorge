class Player < ApplicationRecord

    def put_down(level, h_pos, v_pos)
        if put_points <= 0
            puts "You are out of put points"
            return
        end
        if username == "Player 1"
            start_line = 1
        end
        if username == "Player 2"
            start_line = 8
        end
        if v_pos != self.start_line
            puts "Cannot place there"
            return
        end
        position = h_pos.to_str + v_pos.to_str
        if board.position
            puts "Cannot place there"
            return
        else
            Piece.create!(level: level, h_pos: h_pos, v_pos: v_pos)
            put_points = put_points - level
        end
    end


    def attack(attacked_piece)
        if self.variant > attacked_piece.variant
            self.position = attacked_piece.position
            attacked_piece.destroy
        else
            self.destroy
        end
    end

    def turn
        put_points = 5
        move_points = 5


    end




end
