class BootsController < ApplicationController

  def index
    @boots = Boot.all
  end

  def new
    @boot = Boot.new
  end

  def create
    @boot = Boot.new(params[:boot])

    if @boot.save
      redirect_to boots_path, :notice => 'Successfully created'
    else
      render :action => :new
    end
  end

  def edit
    @boot = Boot.find(params[:id])
  end

  def update
    @boot = Boot.find(params[:id])

    if @boot.update_attributes(params[:boot])
      redirect_to boots_path, :notice => 'Successfully updated'
    else
      render :action => :edit
    end
  end

  def destroy
    @boot = Boot.find(params[:id])
    @boot.destroy

    redirect_to boots_path, :notice => 'Successfully deleted'
  end

end
