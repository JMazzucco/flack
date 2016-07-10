class HomeController < ApplicationController
  skip_before_action :authenticate
  
  def show
   binding.pry
  end
end