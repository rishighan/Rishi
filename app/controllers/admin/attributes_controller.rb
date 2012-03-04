class Admin::AttributesController < ApplicationController
  def index
  end

  def new
    @attribute = Attribute.new
    
    respond_to do |format|
      format.html {} #new.html.erb
    end
  end

  def update
  end

  def destroy
  end

end
