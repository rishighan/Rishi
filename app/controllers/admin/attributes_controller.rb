class Admin::AttributesController < ApplicationController
  def index
  end

  def new
    @attribute = Attribute.new
   respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @category }
    end
  end
  
  def create
    @attribute = Attribute.new(params[:attribute])
     respond_to do |format|
      if @attribute.save
        format.html { redirect_to admin_attributes_url, :notice => 'Attribute was successfully created.' }
        format.json { render :json => @attribute, :status => :created, :location => @attribute }
      else
        format.html { render :action => "new" }
        format.json { render :json => @attribute.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  def update
  end

  def destroy
  end

end
