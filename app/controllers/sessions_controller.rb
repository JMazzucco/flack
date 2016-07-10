class SessionsController  < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    user = User.find_or_create_from_omniauth(auth)
    if user
      log_in(user)
      Adapter::TrelloWrapper.authorize!(user)
      redirect_to new_organization_path
    else
      # some flash message
      redirect_to root_path
    end
  end

  private
    def auth
      request.env["omniauth.auth"]
    end
end