module MenuItemsHelper

  ## Strong Parameters
  def menu_item_params
    params.require(:menu_item).permit(
      :name,
      :description,
      :price,
      :tag_list
    )
  end

end
