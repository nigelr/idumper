class BitsController < ApplicationController
  
  before_filter :login_required, :except => [:index, :show, :tagged]
  before_filter :get_tag_cloud, :except => [:create, :update, :destroy] # TODO any other methods that don't require tag cloud?    
  
  def index
    @bits = Bit.get_list(current_user, current_user)
    @user = current_user
  end
  
  def person_bits
    @user = User.find(params[:id])
    @bits = Bit.get_list(@user)
    render :action=>"index"
  end
  
  def search
    @bits, @tags = Bit.search params[:search]
#    @tags = Bit.get_tags(@bits)
    @user = current_user 
    render :action=>"index"
  end
  
  def tagged
    tag = params[:id]
    @bits = Bit.find_tagged_with(tag)
    @user = current_user
    @page_title = 'Bits tagged with ' + tag
    render :action=>"index"
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
  
  private
    def get_tag_cloud
      # gets the top 100 tags, change the limit to fine tune
      @tags = Bit.tags(:limit => 100, :order => "name desc")
    end
    
end
