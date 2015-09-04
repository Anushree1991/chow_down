class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
    render :json => @order_items
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = OrderItem.create(order_id: params[:order_id], item_id: params[:item_id], quantity: params[:quantity], status: params[:status])

    respond_to do |format|
      if @order_item.save        
        format.json { render :show, status: :created, location: @order_item }
      else        
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    order_items = OrderItem.find_by_id(params[:id])
    order_items.order_id = params[:order_id]
    order_items.item_id = params[:item_id]
    order_items.quantity = params[:quantity]
    order_items.status = params[:status]    
    if order_item.save
      order_item_details = OrderItem.find_by_id(params[:id])
      render :json => order_item_details
    else      
      format.json { render json: @order_item.errors, status: :unprocessable_entity }
    end    
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:order_id, :item_id, :quantity, :status)
    end
end
