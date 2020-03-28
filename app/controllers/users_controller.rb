class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :disable, :enable, :requests]

  # POST /user/create
  def create
    @user = User.new(user_params)
    if @user.save
      @message = {"status": "1", "message": "L'utilisateur a été créé"}
    else
      @message = {"status": "0", "message": @user.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join}
    end

    render json: @message
  end

  # GET /users
  def list
    @users = User.all.order("created_at DESC")

    render json: {"Users" => @users}
  end

  # PUT /user/:id
  def update
    if @user.blank?
      @message = {"status": "0", "message": "Cet utilisateur n'existe pas"}
    else
      @user.update_attributes(user_params)
      if @user.errors.full_messages.blank?
        @message = {"status": "1", "message": "Le profil de l'utilisateur a été mis à jour"}
      else
        @message = {"status": "0", "message": @user.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join}
      end
    end

    render json: @message
  end

  # PUT /user/disable/:id
  def disable
    if @user.blank?
      @message = {"status": "0", "message": "Cet utilisateur n'existe pas"}
    else
      @user.update_attributes(active: 0)
      if @user.errors.full_messages.blank?
        @message = {"status": "1", "message": "Le compte de l'utilisateur a été désactivé"}
      else
        @message = {"status": "0", "message": @user.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join}
      end
    end

    render json: @message
  end

  # PUT /user/enable/:id
  def enable
    if @user.blank?
      @message = {"status": "0", "message": "Cet utilisateur n'existe pas"}
    else
      @user.update_attributes(active: 1)
      if @user.errors.full_messages.blank?
        @message = {"status": "1", "message": "Le compte de l'utilisateur a été activé"}
      else
        @message = {"status": "0", "message": @user.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join}
      end
    end

    render json: @message
  end

  # POST /user/login
  def login
    @user = User.where("(email = '#{params[:email]}' AND password = '#{params[:password]}') OR (phone = '#{params[:phone]}' AND password = '#{params[:password]}')")
    if @user.blank?
      @message = {"status": "0", "message": "Veuillez vérifier les paramètres de connexion"}
    else
      @message = {"Users" => @user}
    end

    render json: @message
  end

  # GET /user/:id
  def show
    if @user.blank?
      @message = {"status": "0", "message": "Cet utilisateur n'existe pas"}
    else
      @message = {"Users" => @user}
    end

    render json: @message
  end

  # GET /user/requests/:id
  def requests
    if @user.blank?
      @message = {"status": "0", "message": "Cet utilisateur n'existe pas"}
    else
      @requests = @user.requests
      @message = {"User requests" => @requests}
    end

    render json: @message
  end


  private

  def user_params
    params.permit(:firstname, :lastname, :phone, :email, :password, :active, :profile_id, :terms, :is_admin, :created_uid, :updated_uid)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
