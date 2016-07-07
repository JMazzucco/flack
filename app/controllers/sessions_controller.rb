class SessionsController  < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    binding.pry
    user = User.find_or_create_from_omniauth(auth)
  end

  private
    def auth
      request.env["omniauth.auth"]
    end
end