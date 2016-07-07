class OrganizationGenerator

  def generate(client, trello_id)
    org_info = client.get_org_info(trello_id)
    Organization.new(trello_id: org_info.attributes["id"], name: org_info.attributes["name"], display_name: org_info.attributes["display_name"], url: org_info.attributes["url"], description: org_info.attributes["description"])
  end
end
