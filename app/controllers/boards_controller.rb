class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    board_info = Trello::Board.find(board_params[:trello_id])
    board = Board.new(trello_id: board_info.attributes[:id], name: board_info.attributes[:name], description: board_info.attributes[:description], url: board_info.attributes[:url])
    if board.save
      Trello::Webhook.create(description: board.name, 
        callback_url: "#{ENV['FLACK_DOMAIN']}/webhooks/receive", 
        id_model: board.trello_id)
    else
      # some kind of flash message
    end
  end

  private
    def board_params
      params.require(:board).permit(:trello_id)
    end

end
