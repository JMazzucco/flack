class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end

  def create
    organization = OrganizationGenerator.generate(organization_params[:trello_id])
    if organization.save
      UserOrganization.create(user: current_user, organization: organization)
      webhook = WebhookGenerator.generate(organization)
      if webhook.save
       #something successful happens
       redirect_to organization_path(organization)
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
