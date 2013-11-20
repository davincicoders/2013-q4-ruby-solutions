class MainController < ApplicationController

  def order_form
    @order = SubOrder.new
    render :order_form and return
  end

  def place_order
    @order = SubOrder.new
    @order.sandwich_type   = params["sandwich_type"]
    @order.bread_type      = params["bread_type"]
    @order.is_twelve_inch  = params["is_twelve_inch"]
    @order.has_extra_meat  = params["has_extra_meat"]
    @order.has_chips       = params["has_chips"]
  
    total_price = 3.49

    if @order.is_twelve_inch == true
      total_price = total_price + 2.00
    end

    if @order.has_extra_meat == true
      total_price = total_price + 0.49
    end

    if @order.has_chips == true
      total_price = total_price + 0.99
    end

    @order.total_price = total_price
  
    if @order.save == true
      render :thank_you and return
    else
      render :order_form and return
    end
  end

  def list_orders
    @orders = SubOrder.all
    render :list_orders and return
  end

end
