class BitsController < ApplicationController
  
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @bits = Bit.get_list(current_user)
  end
  
  def show
    @bit = Bit.find(params[:id])
  end
  
  def new
    @bit = Bit.new
  end
  
  def create
    @bit = Bit.new(params[:bit])
    @bit.user = current_user
    if @bit.save
      flash[:notice] = "Successfully created bit."
      redirect_to @bit
    else
      render :action => 'new'
    end
  end
  
  def edit
    @bit = Bit.find(params[:id])
  end
  
  def update
    @bit = Bit.find(params[:id])
    if @bit.update_attributes(params[:bit])
      flash[:notice] = "Successfully updated bit."
      redirect_to @bit
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @bit = Bit.find(params[:id])
    @bit.destroy
    flash[:notice] = "Successfully destroyed bit."
    redirect_to bits_url
  end
end
