module Api
  class MenuItemsController < ApplicationController
    include MenuItemsHelper

    def new
      render json: { message: 'hello' }
    end

    def index
      @items = MenuItem.includes(:images, :tags).all
      render json: @items
    end

    def create
      @item = MenuItem.new(menu_item_params)
      if @item.save
        render :show
      else
        render @item.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @item = MenuItem.find_by_id(params[:id])
      if @item
        render :show
      else
        render json: { message: "Item Not Found" }
      end
    end

    def destroy
      @item = MenuItem.find_by_id(params[:id])
      if @item
        @item.destroy
        render json: @item
      else
        render json: { message: "Item Not Found" }
      end
    end

  end
end
