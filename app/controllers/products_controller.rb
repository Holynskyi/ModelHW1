class ProductsController < ApplicationController
  before_action :set_locale, :set_product, only: [:show, :edit, :update, :destroy, :add_to_cart]
  before_filter :authenticate_user!

  #@widget.impressionist_count(:filter=>:all)

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
    #@widget = Widget.find(impressionist(@widget, "message...")) # 2nd argument is optional
    #@widget.impressionist_count(:filter=>:all)
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
    #binding.pry
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "#{@product.name} was successfully created."}
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
      if @product.update(product_params)
          redirect_to @product, notice: "#{@product.name} was successfully updated."
        else
          render :edit
        end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "#{@product.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end 

  def add_to_cart
    account = current_user.account
    if account && account.cart
      cart = account.cart
      @product.cart = cart
      @product.save
      redirect_to products_path, notice: "#{@product.name} has been added to the cart."
    else
      redirect_to cart_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.where(id: params[:id]).first
      render_404 unless @product
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end

    def set_locale
      I18n.locale = :uk
      #binding.pry
    end
end
