class Player < ApplicationRecord

    $put_points = 5
    $move_points = 5

    $board = {
        '11': nil, '21': nil, '31': nil, '41': nil,
        '51': nil, '61': nil, '71': nil, '81': nil,
        '12': nil, '22': nil, '32': nil, '42': nil,
        '52': nil, '62': nil, '72': nil, '82': nil,
        '13': nil, '23': nil, '33': nil, '43': nil,
        '53': nil, '63': nil, '73': nil, '83': nil,
        '14': nil, '24': nil, '34': nil, '44': nil,
        '54': nil, '64': nil, '74': nil, '84': nil,
        '15': nil, '25': nil, '35': nil, '45': nil,
        '55': nil, '65': nil, '75': nil, '85': nil,
        '16': nil, '26': nil, '36': nil, '46': nil,
        '56': nil, '66': nil, '76': nil, '86': nil,
        '17': nil, '27': nil, '37': nil, '47': nil,
        '57': nil, '67': nil, '77': nil, '87': nil,
        '18': nil, '28': nil, '38': nil, '48': nil,
        '58': nil, '68': nil, '78': nil, '88': nil,
    }

    def put_down(level, h_pos, v_pos)
        $put_points = $put_points - level.to_i
        if $put_points < 0
            puts "You are out of put points"
            return
        end
        if username == "Player 1"
            @start_line = 1
        end
        if username == "Player 2"
            @start_line = 8
        end
        if v_pos != @start_line
            puts "Cannot place there"
            return
        end
        position = h_pos.to_s + v_pos.to_s
        position = position.to_sym
        if $board[position]
            puts "Cannot place there"
            return
        else
            if username == "Player 1"
                piece = Piece.new(level: level, h_pos: h_pos, v_pos: v_pos, player: 1)
                pos = h_pos.to_s + v_pos.to_s
                pos = pos.to_sym
                $board[pos] = piece
            end
                if username == "Player 2"
                piece = Piece.new(level: level, h_pos: h_pos, v_pos: v_pos, player: 2)
                pos = h_pos.to_s + v_pos.to_s
                pos = pos.to_sym
                $board[pos] = piece
            end
            
        end
    end

    def move_piece(piece, new_position)
        puts piece
        $move_points = $move_points - 1
        if $move_points < 0
            puts "You cannot move another piece."
            return
        end
        puts piece
        t_h_pos = piece[:"h_pos"].to_s
        t_r_pos = piece[:"r_pos"].to_s
        t = t_h_pos + t_r_pos
        t = t.to_sym
        new_h_pos = ((new_position * 1.0) / 10).to_int
        new_v_pos = new_position % 10
        if Math.sqrt((h_pos - new_h_pos)**2 + (v_pos - new_v_pos)**2) > 1.5
            puts "One tile at a time"
            return
        end
        new_pos = new_h_pos.to_s + new_v_pos.to_s
        new_pos = new_pos.to_sym
        if Player.board[new_pos]
            piece.attack(Player.board[new_pos])
        else
            piece[h_pos] = new_h_pos
            piece[v_pos] = new_v_pos
        end
        Player.board[t] = nil
    end

    def attack(attacked_piece)
        t = self.position
        if self.variant > attacked_piece.variant
            self.position = attacked_piece.position
            board.t = nil
            attacked_piece.destroy
        else
            self.destroy
        end
    end

    def self.board
        # puts $board
        return $board
        # 8.times do |r|
        #     8.times do |c|
        #         row = (r+1).to_s
        #         col = (c+1).to_s
        #         coord = row + col
        #         coord = coord.to_sym
        #         puts coord
        #         if $boord[coord]==false
        #             print("empty ")
        #         else
        #             print $boord[coord]
        #         # puts $board[coord]
        #         end
        #     end
        #     puts
        # end
            
        # x = "11"
        # x = x.to_sym
        # puts $board[x]
    end

    def turn
       
        while ($put_points > 0 || $move_points > 0)
            puts "What action would you like to take? Say 'put piece' or 'move piece' or 'end turn'"
            action = gets.chomp
            puts "Action: " + action
            if action == "put piece"
                puts "What level?"
                level = gets.chomp
                puts "Horizontal position?"
                h_pos = gets.chomp
                h_pos = h_pos.to_i
                puts "Vertical position?"
                v_pos = gets.chomp
                v_pos = v_pos.to_i
                ##
                self.put_down(level, h_pos, v_pos)
            end
            if action == "move piece"
                puts "From where? (enter a coordinate in number form, such as 12)"
                origin = gets.chomp
                origin.to_s
                origin.to_sym
                puts "origin is, "
                puts origin 
                piece = $board[origin]
                puts "Piece is: "
                puts piece
                puts "To where? (enter a coordinate in number form, such as 12)"
                destination = gets.chomp
                destination.to_i
                ##
                self.move_piece(piece, destination)
            end
        end



    end




end
