class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # POST /request/create
  def create
    @request = Request.new(request_params)
    if @request.save
      @message = {"status": "1", "message": "La requête a été créée"}
    else
      @message = {"status": "0", "message": @request.errors.full_messages.map { |msg| "<p>#{msg}</p>" }.join}
    end

    render json: @message
  end

  private

  def request_params
    params.permit(:user_id, :reference, :text, :status, :type_request, :created_uid, :updated_uid)
  end

  def set_request
    @request = Request.find_by_id(params[:id])
  end
end
