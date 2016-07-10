class WebhooksController < ApplicationController
  skip_before_action :authenticate
  skip_before_action :verify_authenticity_token
  
  def complete
    # if request method HEAD, else recieve payload and do stuff with it/send slack messages
    return head :ok
  end

  def receive
    binding.pry
    # all of this is b/c payload from webhook added to org, when new board created has NO INFO about the even that trigged the payload POST
    #  So, iterate over all boards, ID new ones, create and add webhook, then, we'll need separate code to deal with payload
    #  that we get when new card/changes to board that has been hooked.   I REALLY HOPE *THAT* PAYLOAD HAS SOME BETTER INFO!!!
    org = Organization.find_by(trello_id: model_params[:id])
    trello_org = Adapter::TrelloWrapper.get_org_info(org.trello_id)
    board_ids = trello_org.boards.collect {|b| b.attributes[:id]}
    new_board_ids = board_ids.select {|id| Board.find_by(trello_id: id) == nil}
    new_board_ids.each do |id|
      board = BoardGenerator.generate(id)
      if board.save
        # not sure if Trello.client will still be authenticated at this point
        webhook = WebhookGenerator.generate(board)
        binding.pry
        if webhook.save
          # some kind of logging
        else
          # some kind of error logging
        end
      end
    end
  end

  private

    def model_params
      params.require(:model).permit(:id)
    end

end
