class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
    render :json => @accounts
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.create(name: params[:name], description: params[:desc], welcome_msg: params[:msg])

    respond_to do |format|
      if @account.save
        format.json { render :show, status: :created, location: @account }
      else        
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    account = Account.find_by_id(params[:id])
    account.name = params[:name]
    account.description = params[:desc]
    account.welcome_msg = params[:msg]
    if account.save
      account_details = Account.find_by_id(params[:id])
      render :json => account_details
    else
      format.json { render json: @account.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :description, :welcome_msg)
    end
end
