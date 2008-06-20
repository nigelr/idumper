class BitsController < ApplicationController
  def index
    @bits = Bit.find(:all)
  end
  
  def show
    @bit = Bit.find(params[:id])
  end
  
  def new
    @bit = Bit.new
  end
  
  def create
    @bit = Bit.new(params[:bit])
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
