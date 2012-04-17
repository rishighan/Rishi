class Admin::TraitsController < ApplicationController
  layout 'admin_layout'
  def index
  end

  def new
    @trait = Trait.new
   respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @category }
    end
  end
  
  def create
    @trait = Trait.new(params[:trait])
     respond_to do |format|
      if @trait.save
        format.html { redirect_to admin_path, :notice => 'Trait was successfully created.' }
        format.json { render :json => @trait, :status => :created, :location => @trait }
      else
        format.html { render :action => "new" }
        format.json { render :json => @trait.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  def update
  end

  def destroy
  end

end
