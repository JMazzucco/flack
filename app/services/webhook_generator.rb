class WebhookGenerator

  def generate(client, board)
    client.create_webhook(board)
  end
end