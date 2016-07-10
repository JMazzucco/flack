class WebhookGenerator

  def self.generate(model)
    Adapter::TrelloWrapper.create_webhook(model)
  end
end