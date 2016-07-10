class WebhooksController < ApplicationController
  skip_before_action :authenticate
  skip_before_action :verify_authenticity_token
  
  def complete
    # if request method HEAD, else recieve payload and do stuff with it/send slack messages
    return head :ok
  end

  def receive
    binding.pry
   
    
    # if only Board (i.e. NOT list and NOT card)
      # create board, associate to org, add webhook
    # if board + list and NOT card
      # create list, associate to board, add webhook
    # if board + list + card
      # create card, assocaite to list and board, add webhook
    # what payloads to we get when cards get updated -- members added/subtracted, status or lable changes, open/closed. etc.?

  end

  private

    def model_params
      params.require(:model).permit(:id)
    end

end
