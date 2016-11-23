class TagsController < ApplicationController

  def index
    @tags = Tag.all.page(params[:page]).per(10)
  end

  def show
    @tags = Tag.find params[:id]
  end

end
