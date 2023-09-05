class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  
  # GET /products or /products.json
def index
  @products = Product.all

  apply_search
  apply_filter
  apply_order
end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|Q
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

    def apply_search 
      if params[:search].present?
        @products = @products.search(params[:search])
      end
    end

    def apply_filter
      if params[:status].present?
        @products = @products.status(params[:status])
      end

      if params[:min_profitabily_rate].present?
        @products = @products.profitabily_rate_mim(params[:min_profitabily_rate])
      end

      @products
    end

    def apply_order
      order_by = params[:order] || 'name'
      direction = params[:direction] || 'asc'
    
      @products = @products.order("#{order_by} #{direction}")
    end
      # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :status, :destination, :profitabily_rate, :minimum_period_for_realization, :administration_fee, :due_date, :daily_liquidity)
    end
end
