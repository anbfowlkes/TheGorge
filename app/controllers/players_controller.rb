class PlayersController < ApplicationController

    board = {
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

    def index
        render json: Player.all
    end

    def show
        render html: 'Welcome to the Gorge'
    end

    def pieceshow
        render json: PlayerOnePiece.find(params[:id])
    end
end
