class DirectoriesController < ApplicationController
  include ActiveRecordExtension

  def index
    @items = model_class.all
  end

  def new
    @item = model_class.new
  end

  def create
    @item = model_class.new(params[model_class.to_s.downcase.to_sym])

    if @item.save
      redirect_to boots_path, :notice => 'Successfully created'
    else
      render :action => :new
    end
  end

end
