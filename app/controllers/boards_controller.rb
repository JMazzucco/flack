class BoardsController < ApplicationController
  
  def new
    @board = Board.new
  end

  def create
    client = Adapter::TrelloWrapper.new(current_user)
    board = BoardGenerator.generate(client)
    if board.save
     webhook = WebhookGenerator.generate(client, board)
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
