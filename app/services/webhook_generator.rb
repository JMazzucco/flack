class WebhookGenerator

  def self.generate(model, type:)
    Adapter::TrelloWrapper.create_webhook(model, type: type)
  end
end