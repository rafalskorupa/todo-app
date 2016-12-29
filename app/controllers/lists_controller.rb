class ListsController < ApplicationController
  def index
    @lists = List.order("updated_at DESC").first(24)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create!(list_params)

    respond_to do |f|
      f.html { redirect_to @list }
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
