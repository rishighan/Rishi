class Admin::VariantsController < ApplicationController
  def index
  end

  def new
    @variant = Variant.new
    @trait = @variant.traits.new
   respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @variant }
    end
  end
  
  def create
    @variant = Variant.new(params[:variant])
     respond_to do |format|
      if @variant.save
        format.html { redirect_to admin__products_variants_url, :notice => 'Trait was successfully created.' }
        format.json { render :json => @variant, :status => :created, :location => @variant }
      else
        format.html { render :action => "new" }
        format.json { render :json => @variant.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  def update
  end

  def destroy
  end

end
