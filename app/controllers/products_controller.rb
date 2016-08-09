class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :add_to_cart]
  before_filter :authenticate_user!

  def sum
    @price_sum = Product.sum(:price)
  end

  def averedge
    @averedge_price = Product.average(:price)
  end

  def extremums
    @temp = Product.order(price: :desc)
    @max = @temp[0]
    @min = @temp[-1]
  end

  def onlyTV 
    @TVinclude = Product.where(name:'TV')
  end

  def cheap
    @cheap = Product.where('price<?',100)
  end

  # GET /products
  # GET /products.json
  def index
    text = params["text"].presence
    #binding.pry
    @products = Product.all    
    @products = @products.where(name: text) if text
    @products = @products.order(:price)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end 

  def add_to_cart
    @account=current_user.account
    @cart = @account.cart
    @product.cart = @cart
    @product.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end
end
