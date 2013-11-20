class DirectoriesController < ApplicationController
  include ActiveRecordExtension

  def index
    @items = model_class.all
  end

  def new
    @item = model_class.new
  end

  def edit
    @item = model_class.find(params[:id])
  end

  def update
    @item = model_class.find(params[:id])

    if @item.update_attributes(params[model_class.to_s.downcase.to_sym])
      redirect_to model_class, :notice => 'Successfully updated'
    else
      render :action => :edit
    end
  end

  def create
    @item = model_class.new(params[model_class.to_s.downcase.to_sym])

    if @item.save
      redirect_to model_class, :notice => 'Successfully created'
    else
      render :action => :new
    end
  end

  def destroy
    @item = model_class.find(params[:id])
    @item.destroy

    redirect_to model_class, :notice => 'Successfully deleted'
  end

end
