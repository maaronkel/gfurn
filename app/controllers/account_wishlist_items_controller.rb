class AccountWishlistItemsController < ApplicationController
  def update
    wishlist = AccountWishlist.where(item: Item.find(params[:item]), account: current_account)
    if wishlist == []
      # create wishlist item
      AccountWishlist.create(item: Item.find(params[:item]), account: current_account )
      @wishlist_exists = true
    else
      # delete wishlist item
      wishlist.destroy_all
      @wishlist_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
