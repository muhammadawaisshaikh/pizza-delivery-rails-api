class V1::OrdersController < ApplicationController
  
  def index
    orders = Order.all
    render json: { orders: orders }, status: :ok
  end

  def create
    order = Order.new(order_params)

    if order.save
      render json:order, status: :created
    else
      render json: {errors: order.errors}, status: :unprocessable_entity
    end
  end

  def show
    order = Order.find(params[:id])
    render json: order, status: :ok
  end  

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      render json: order, status: :ok
    else
      render json: { errors: order.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    head 204
  end

  private
  
  def order_params
    params.require(:order).permit(:name, :email, :mobile, :address, :ordered_products, :total)
  end

end
