require 'test_helper'

class AccountWishlistItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get account_wishlist_items_update_url
    assert_response :success
  end

end
