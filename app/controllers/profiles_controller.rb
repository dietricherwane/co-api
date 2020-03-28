class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

  # POST /profile/create
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      @message = {"status": "1", "message": "Le profil a été créé"}
    else
      @message = {"status": "0", "message": @profile.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join}
    end

    render json: @message
  end

  # GET /profiles
  def list
    @profiles = Profile.all.order("name ASC")

    render json: {"Profiles" => @profiles}
  end

  # PUT /profile/:id
  def update
    if @profile.blank?
      @message = {"status": "0", "message": "Ce profil n'existe pas"}
    else
      @profile.update_attributes(profile_params)
      if @profile.errors.full_messages.blank?
        @message = {"status": "1", "message": "Le profil a été mis à jour"}
      else
        @message = {"status": "0", "message": @profile.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join}
      end
    end

    render json: @message
  end

  # GET /profile/:id
  def show
    if @profile.blank?
      @message = {"status": "0", "message": "Ce profil n'existe pas"}
    else
      @message = {"Profiles" => @profile}
    end

    render json: @message
  end


  private

  def profile_params
    params.permit(:name, :description, :created_uid, :updated_uid)
  end

  def set_profile
    @profile = Profile.find_by_id(params[:id])
  end
end
