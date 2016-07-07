class OrganizationsController < ApplicationController

  def create
    client = Adapter::TrelloWrapper.new(current_user)
    organization = OrganizationGenerator.generate(client)
    if organization.save
     webhook = WebhookGenerator.generate(client, organization)
     if webhook.save
      #something successful happens
     end
    else
      # some kind of flash message
    end
  end


  private
    def organization_params
      params.require(:organization).permit(:trello_id)
    end
end
