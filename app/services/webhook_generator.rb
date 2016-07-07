class WebhookGenerator

  def generate(client, model)
    client.create_webhook(model)
  end
end