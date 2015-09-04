class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    render :json => @items
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.create(name: params[:name], price: params[:price], menu_id: params[:menu_id], active: params[:active])

    respond_to do |format|
      if @item.save        
        format.json { render :show, status: :created, location: @item }
      else        
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    item = Item.find_by_id(params[:id])
    item.name = params[:name]
    item.price = params[:price]
    item.menu_id = params[:menu_id]
    item.active = params[:active]    
    if item.save        
      item_details = Item.find_by_id(params[:id]) 
      render :json => item_details
    else        
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end    
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :price, :menu_id, :active)
    end
end
