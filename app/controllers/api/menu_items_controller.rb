module Api
  class MenuItemsController < ApplicationController
    include MenuItemsHelper

    def create
      @item = MenuItem.new(menu_item_params)
      if @item.save
        render :show
      else
        render @item.errors.full_messages, status: :unprocessable_entity
      end
    end

  end
end
