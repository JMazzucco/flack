class BoardGenerator

  def generate(client, trello_id)
    board_info = client.get_board_info(trello_id)
    Board.new(trello_id: board_info.attributes["id"], name: board_info.attributes["name"], description: board_info.attributes["description"], url: board_info.attributes["url"])
  end
end