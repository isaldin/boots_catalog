class DirectoriesController < ApplicationController

  def index
    @items = model_name.all
  end

  private

  def model_name
    controller_name.classify.constantize
  end

end
