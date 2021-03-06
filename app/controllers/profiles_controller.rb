class ProfilesController < ApplicationController
  before_action :set_profile, except: [:index, :new, :create]

  def index
    @profiles = Profile.all
  end

  def show
    @posts = @profile.posts
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
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
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :language, :experience, :bio, :avatar)
  end
end
