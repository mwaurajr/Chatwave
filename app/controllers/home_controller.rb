class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.all
  end
end
