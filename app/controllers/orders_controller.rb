class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    render :json => @orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.create(account_id: params[:acnt_id], tag_id: params[:tag_id], user_id: params[:user_id], status: params[:status])

    respond_to do |format|
      if @order.save        
        format.json { render :show, status: :created, location: @order }
      else        
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    order = Order.find_by_id(params[:id])
    order.account_id = params[:acnt_id]
    order.tag_id = params[:tag_id]
    order.user_id = params[:user_id]
    order.status = params[:status]    
    if @order.update(order_params)   
      order_details = Order.find_by_id(params[:id])
      render :json => order_details       
    else    
      format.json { render json: @order.errors, status: :unprocessable_entity }      
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:account_id, :tag_id, :user_id, :status)
    end
end
