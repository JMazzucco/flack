class BoardGenerator

  def self.generate(trello_id)
    board_info = Adapter::TrelloWrapper.get_board_info(trello_id)
    organization = Organization.find_by(trello_id: board_info.attributes[:organization_id])
    Board.new(trello_id: board_info.attributes[:id], name: board_info.attributes[:name], description: board_info.attributes[:description], url: board_info.attributes[:url], organization: organization)
  end
end