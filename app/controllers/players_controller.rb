class PlayersController < ApplicationController
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
