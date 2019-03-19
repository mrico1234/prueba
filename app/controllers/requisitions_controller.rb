class RequisitionsController < ApplicationController
  before_action :set_requisition, only: [:show, :edit, :update, :destroy]
  #skip_before_action :verify_authenticity_token

  def index
    #@requisitions = Requisition.all
    #uri = URI.parse('http://localhost:3000/ordens')
    #http = Net::HTTP.new(uri.host, uri.port)
    #res = http.send_request("POST", uri, params.to_json, headers)
    
    #@response = JSON.parse(res.body)

    
  end


  # PATCH/PUT /requisitions/1
  # PATCH/PUT /requisitions/1.json
  def update

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requisition
      @requisition = Requisition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requisition_params
      params.fetch(:requisition, {})
    end
end
