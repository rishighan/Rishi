class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      
      format.html
    end
  end

  
  
  def create
    @user = User.new(params[:user])
    
    respond_to  do |format|
    if @user.save
      format.html {redirect_to @user, :notice => "signed up"}
      
    else
      format.html {render :action => "new"}
    end
    
    end
  end
end

