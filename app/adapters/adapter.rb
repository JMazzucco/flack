module Adapter

  class TrelloWrapper

    CALLBACK_URL = "#{ENV["FLACK_DOMAIN"]}/webhooks/receive"

    def initialize(current_user)
      configure_client(current_user)
    end

    def configure_client(current_user)
      Trello.configure do |config|
        config.consumer_key = ENV["TRELLO_KEY"]
        config.consumer_secret = ENV["TRELLO_SECRETY"]
        config.oauth_token = current_user.token
        config.oauth_token_secret = current_user.secret
      end
    end

    def create_webhook(board)
      webhook_info = Trello::Webhook.create(description: board.name, callback_url: CALLBACK_URL, id_model: board.trello_id)
      Webhook.new(id: webhook_info["id"], name: webhook_info["name"])
    end

    def get_board_info(short_id)
      Trello::Board.find(short_id)
    end
  end
end
