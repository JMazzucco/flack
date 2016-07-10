module Adapter

  class TrelloWrapper

    CALLBACK_URL = "#{ENV["FLACK_DOMAIN"]}/webhooks/receive"

    def self.authorize!(current_user)
      configure_client(current_user)
    end

    def self.configure_client(current_user)
      Trello.configure do |config|
        config.consumer_key = ENV["TRELLO_KEY"]
        config.consumer_secret = ENV["TRELLO_SECRET"]
        config.oauth_token = current_user.token
        config.oauth_token_secret = current_user.secret
      end
    end

    def self.create_webhook(model)
      # webhook_info = Trello::Webhook.create(description: model.name, callback_url: CALLBACK_URL, id_model: model.trello_id)
      binding.pry
      webhook_info = HTTParty.post("https://api.trello.com/1/tokens/#{Trello.client.oauth_token}/webhooks/?key=#{ENV["TRELLO_KEY"]}",
        :query => { description: "test", callbackURL: CALLBACK_URL, idModel: model.trello_id },
        :headers => { "Content-Type" => "application/x-www-form-urlencoded"})
      binding.pry
      Webhook.new(trello_id: webhook_info["id"], description: webhook_info["description"], active: true, callback_url: webhook_info["callbackURL"], trello_id_model: model.trello_id)
    end

    def self.get_board_info(trello_id)
      Trello::Board.find(trello_id)
    end

    def self.get_org_info(trello_id)
      Trello::Organization.find(trello_id)
    end
  end
end

# should be, authorize client when user logs in/is authorized. Then, all these other methods are class methods that wrape Trello::Whatever method calls.
#  That way, we don't pass client around or user around. just use client.oauth_token instead of current_user.token for webhook create
