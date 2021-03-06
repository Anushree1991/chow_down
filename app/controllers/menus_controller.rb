class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
    render :json => @menus
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.create(name: params[:name], account_id: params[:acnt_id], active: params[:active])

    respond_to do |format|
      if @menu.save        
        format.json { render :show, status: :created, location: @menu }
      else        
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    menu = Menu.find_by_id(params[:id])
    menu.name = params[:name]
    menu.account_id = params[:acnt_id]
    menu.active =params[:active]  
    if menu.save        
      menu_details = Menu.find_by_id(params[:id])
      render :json => menu_details
    else        
      format.json { render json: @menu.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :account_id, :active)
    end
end
