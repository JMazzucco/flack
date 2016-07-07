class WebhooksController < ApplicationController
  skip_before_action :authenticate
  
  def receive
    return head :ok
  end

end
