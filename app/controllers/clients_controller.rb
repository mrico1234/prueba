class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
    render json: @clients
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    render json: @client
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.permit(:name, :lastname, :number_document, :phone, :address)
    end
end
