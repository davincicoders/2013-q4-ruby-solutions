class MainController < ApplicationController
  def index
    @new_order = Order.new
    render :index and return
  end

  def place_order
    @new_order = Order.new
    @new_order.material_id = params["material_id"]
    @new_order.num_linear_inches = params["num_linear_inches"]
    @new_order.include_hanging_hardware = params["include_hanging_hardware"]

    if @new_order.material != nil
      price = @new_order.material.base_price
    else
      price = 0.00 # to avoid error
    end

    if @new_order.num_linear_inches != nil
      price = price + @new_order.num_linear_inches * 1.00
    end

    if @new_order.include_hanging_hardware == true
      price = price + 0.50
    end

    @new_order.total_price = price

    if @new_order.save == true
      flash[:info] = "Thank you for your order."
      redirect_to "/" and return
    else
      render :index and return
    end
  end
end
