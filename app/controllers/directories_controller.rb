class DirectoriesController < ApplicationController
  include ActiveRecordExtension

  def index
    @items = model_class.all
  end

end
