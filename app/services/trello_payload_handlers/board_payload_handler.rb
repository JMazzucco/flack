class BoardPayloadHandler

  attr_accessor :payload, :board, :event_type

  def initialize(payload)
    binding.pry
    @payload = payload
    @event_type = payload["event"]["type"]
  end

  def run
    if event_type == "addToOrganizationBoard"
      @board = Board.create_from_trello_payload(trello_id: payload_board_id, name: payload_board_name, url: payload_board_url, description: payload_board_description, organization: payload_organization)
      create_board_webhook
      # other events?
    end
  end 

  def create_board_webhook
    webhook = Adapter::TrelloWrapper.create_webhook(board, type: "board")
    if webhook.save
      #some kind of logging
    else
      # logg the error
    end
  end

  def payload_board_id
    payload["event"]["data"]["board"].dig("id")
  end

  def payload_board_name
    payload["event"]["data"]["board"].dig("name")
  end

  def payload_board_url
    payload["event"]["data"]["board"].dig("shortlink")
  end

  def payload_board_description
    payload["event"]["data"]["board"].dig("description")
  end

  def payload_organization
    Organization.find_by(trello_id: payload["data"]["organization"]["id"])
  end
end


# {"model"=>
#   {"id"=>"578251f059bce751763c9175",
#    "name"=>"secondtestteam",
#    "displayName"=>"Second Test Team",
#    "desc"=>"another test team b/c webhooks suck",
#    "descData"=>nil,
#    "url"=>"https://trello.com/secondtestteam",
#    "website"=>nil,
#    "logoHash"=>nil,
#    "products"=>[],
#    "powerUps"=>[]},
#  "event"=>
#   {"id"=>"5782c8d38f40552d7f482815",
#    "idMemberCreator"=>"556478763b736269c0299f54",
#    "data"=>
#     {"organization"=>
#       {"name"=>"Second Test Team", "id"=>"578251f059bce751763c9175"},
#      "board"=>
#       {"shortLink"=>"eKwu4f29",
#        "name"=>"my best board ever",
#        "id"=>"5782c8d38f40552d7f482812"}},
#    "type"=>"addToOrganizationBoard",
#    "date"=>"2016-07-10T22:14:43.274Z",
#    "memberCreator"=>
#     {"id"=>"556478763b736269c0299f54",
#      "avatarHash"=>nil,
#      "fullName"=>"Sophie DeBenedetto",
#      "initials"=>"SD",
#      "username"=>"sophiedebenedetto1"}},
#  "controller"=>"webhooks",
#  "action"=>"receive",
#  "webhook"=>{}}
