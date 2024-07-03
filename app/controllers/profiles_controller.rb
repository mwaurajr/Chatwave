class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @profiles = Profile.all
  end

  def show
    @profiles = Profile.all

    @profile = Profile.find_by(username: params[:username])
    if @profile.nil?
      redirect_to root_path, alert: "Profile not found."
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to root_path, notice: "Profile successfully created!"
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :status, :about)
  end
end
