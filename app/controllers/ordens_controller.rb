class OrdensController < ApiController
  before_action :set_orden, only: [:show, :edit, :update, :destroy]
  #skip_before_action :verify_authenticity_token

  # GET /ordens
  # GET /ordens.json
  def index
    @ordens = Orden.all
    render json: @ordens
  end

  # GET /ordens/1
  # GET /ordens/1.json
  def show
    render json: @orden
  end

  def create
    @orden = Orden.new(orden_params)
    @orden.clients = params[:clients]

    if @orden.save
      render json: @orden, status: :created, location: @orden
    else
      render json: @orden.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ordens/1
  # PATCH/PUT /ordens/1.json
  def update
    if !params[:status].blank?
      mensaje  = ''
      case params[:status]
        when 'prepation'
          @orden.may_run? ? @orden.run! : (mensaje = 'No puedes pasar a preparación')
        when 'finished'
          @orden.may_walk? ? @orden.walk! : (mensaje = 'No puedes finalizar la orden')
        when 'canceled'
          @orden.may_hold? ? @orden.hold! : (mensaje = 'No puedes anular la orden')
        else mensaje = "Error en el valor del parametro"
      end
      if mensaje.blank?
        return render json: { orden: @orden, mensaje: "Cambio de estado exitoso" }, status: :ok
      else
        return render json: { orden: @orden, mensaje: "#{mensaje}, o pasar al estado #{params[:status]} " }, status: :unprocessable_entity
      end
    else
      return render json: { mensaje: "Parametro status es obligatorio y no puede estar en blanco" }, status: :bad_request
    end
  end

  # DELETE /ordens/1
  # DELETE /ordens/1.json
  def destroy
    orden@client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden
      @orden = Orden.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_params
      params.permit(:branch, :code, :start_preparation, :delivery_time, :delivery_method, :delivery_method, :cash_payment, :subtotal, :taxes, :total, :status, :clients)
    end
end
