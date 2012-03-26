class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @cart =current_cart
    if @cart.line_items.empty?
      redirect_to store_url, :notice=>"Your cart is empty"
    return
    end

    @order = Order.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    @order.ip_address = request.remote_ip
    @order.add_line_items_from_cart(current_cart)
    @variant = @order.variants.build
    
    

    respond_to do |format|
      if @order.save
        if @order.purchase
          Cart.destroy(session[:cart_id])
          session[:cart_id] = nil
          Notifier.order_received(@order).deliver
          #render :action => "success"
          format.html {redirect_to store_url, :notice=>'Thank you. Your order has been recieved.'}
          format.xml {render :xml => @order, :status =>:created, :location=> @order}

        else
          format.html {redirect_to store_url, :alert=>"Error"}

          #render :action => "failure"
        end

      else
        format.html { render :action => "new" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, :notice => 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :ok }
    end
  end
end
