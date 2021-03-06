class Api::ItemsController < ApplicationController
  def search
      @q = Item.ransack(search_params)
      @items = @q.result
      render 'api/items/search.js.erb'
  end

  private

  def search_params
    if params[:gchild].present?
      category_ids = params[:gchild]
    elsif params[:child].present?
      @category = Category.find(params[:child])
      category_ids = @category.descendant_ids
    end

    params.require(:q).permit(
      :sorts,
      :name_cont,
      :brand_id_eq,
      :size_id_in,
      :price_gteq,
      :price_lteq,
      { condition_id_in: [] },
      { display_id_in: [] },
      { size_id_in: [] },
      { shipping_charge_in: [] }
      ).merge(category_id_in: category_ids)
  end
end