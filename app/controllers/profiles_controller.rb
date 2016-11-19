class ProfilesController < ApplicationController
  before_action :set_profile, except: [:index, :new, :create]

  def index
    @profiles = Profiles.all
  end

  def show
  end

  def new
    @profile = current_user.profiles.new
  end

  def create
    @profile = current_user.profiles.new(profile_params)
    if @profile.save
      flash[:success] = 'Profile Created Successfully!'
      redirect_to profile_path(@profile)
    else
      flash[:error] = 'Something Went Wrong!'
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = 'Profile Updated Successfully!'
      redirect_to profile_path(@profile)
    else
      flash[:error] = 'Something Went Wrong!'
      render :edit
    end
  end

  def destroy
    @profile.destroy
    flash[:success] = 'Profile Deleted Successfully!'
    redirect_to profiles_path
  end

  private
  def set_profile
    @profile = current_user.profiles.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :language, :experience, :bio)
  end
end
