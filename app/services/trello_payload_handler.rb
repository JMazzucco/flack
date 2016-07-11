Dir[Rails.root.join("app/services/**/*.rb")].each {|f| require f}

class TrelloPayloadHandler

  def self.run(payload)
    if payload["event"]["data"].dig("card")
      CardPayloadHandler.new(payload).run
    elsif payload["event"]["data"].dig("list")
      ListPayloadHandler.new(payload).run
    elsif payload["event"]["data"].dig("board")
      BoardHandler.new(payload).run
    end
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