class V1::TypesController < ApplicationController
  
  def index
    types = Type.all
    render json: { types: types }, status: :ok
  end

  def create
    type = Type.new(type_params)

    if type.save
      render json:type, status: :created
    else
      render json: {errors: type.errors}, status: :unprocessable_entity
    end
  end

  def show
    type = Type.find(params[:id])
    render json: type, status: :ok
  end  

  def update
    type = Type.find(params[:id])
    if type.update(type_params)
      render json: type, status: :ok
    else
      render json: { errors: type.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    type = Type.find(params[:id])
    type.destroy
    head 204
  end

  private
  
  def type_params
    params.require(:type).permit(:name, :amount, :product_id)
  end

end
