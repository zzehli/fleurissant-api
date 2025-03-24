class Admin::StocksController < AdminController
  before_action :set_admin_stock, only: %i[ show edit update destroy ]

  # GET /admin/products/1/stocks or /admin/products/1/stocks.json
  def index
    @admin_stocks = Product.find(params[:product_id]).stocks
    render json: @admin_stocks
  end

  # GET /admin/products/1/stocks/1 or /admin/products/1/stocks/1.json
  def show
    render json: @admin_stock
  end

  # GET /admin/products/1/stocks/new or /admin/products/1/stocks/new.json
  def new
    @product = Product.find(params[:product_id])
    @admin_stock = Stock.new
    render json: { stock: @admin_stock, product: @product }
  end

  # GET /admin/products/1/stocks/1/edit
  def edit
    @product = Product.find(params[:product_id])
    @admin_stock = Stock.find(params[:id])
    render json: { stock: @admin_stock, product: @product }
  end

  # POST /admin/products/1/stocks or /admin/products/1/stocks.json
  def create
    @product = Product.find(params[:product_id])
    @admin_stock = @product.stocks.new(admin_stock_params)

    respond_to do |format|
      if @admin_stock.save
        format.json { render :show, status: :created,  location: admin_product_stock_path(@product, @admin_stock) }
      else
        format.json { render json: @admin_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_stock.update(admin_stock_params)
        format.json { render :show, status: :ok, location: @admin_stock }
      else
        format.json { render json: @admin_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_stock.destroy!

    respond_to do |format|
      format.html { redirect_to admin_products_path, status: :see_other, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_stock
      @admin_stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_stock_params
      params.require(:stock).permit(:amount)
    end
end
