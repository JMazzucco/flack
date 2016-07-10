class BoardsController < ApplicationController
  
  def new
    @board = Board.new
  end

  def create
    board = BoardGenerator.generate(board_params[:trello_id])
    if board.save
     webhook = WebhookGenerator.generate(board)
     if webhook.save
      #something successful happens
     end
    else
      # some kind of flash message
    end
  end

  private
    def board_params
      params.require(:board).permit(:trello_id)
    end

end
