class Api::V1::ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
                     
  respond_to :json
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(params[:id])
  end

end
