class WebhooksController < ApplicationController
  skip_before_action :authenticate
  
  def receive
    # if request method HEAD, else recieve payload and do stuff with it/send slack messages
    return head :ok
  end

end
