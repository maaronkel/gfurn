class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # will make sure that an account who is not signed in and clicks post new item, they are routed to the sign up page
  before_action :authenticate_account!, except: [:home, :index, :search] #, :show]

  before_action :initialize_session
  before_action :load_cart

  def index
    @items = Item.all
  end

  def home 
    @items = Item.all
  end

  def show
    # needed for wishlist
    @wishlist_exists = AccountWishlist.where(item: @item, account: current_account) == [] ? false : true
  end

  def new
    @item = current_account.items.build
  end

  def edit
    
  end

  def create
    @item = current_account.items.build(item_params)
    @item.account = current_account
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to cart_session_url
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to cart_session_url
  end

  def cart_session
  end

  # doesnt work atm
  def search
    if params[:search].blank?
      @items = Item.all
    else
      @items = Item.search(params)
    end
  end

  private
  def initialize_session
    session[:visit_count] ||= 0 # initliaze visit count on first visit
    session[:cart] ||= []
  end

  def load_cart
    @cart = Item.find(session[:cart])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :image, :description, :category, :price)
    end
end
