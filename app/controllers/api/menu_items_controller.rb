module Api
  class MenuItemsController < ApplicationController
    include MenuItemsHelper

    def create
      item = MenuItem.new(menu_item_params)
      if item.save
        # item created
      else
        # item not created
      end
    end

  end
end
