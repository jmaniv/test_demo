class PackagesController < ApplicationController
  before_filter :load_test, :only => [:new, :edit]
  def index
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(params[:package])
    if @package.save
      redirect_to @package, :notice => "Successfully created package."
    else
      load_test
      render :action => 'new'
    end
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    params[:package][:test_ids] ||= []
    @package = Package.find(params[:id])
    if @package.update_attributes(params[:package])
      redirect_to @package, :notice  => "Successfully updated package."
    else
      load_test
      render :action => 'edit'
    end
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    redirect_to packages_url, :notice => "Successfully destroyed package."
  end
  
  private
  def load_test
    @tests = Test.order(:name)
  end
end
