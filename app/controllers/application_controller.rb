class ApplicationController < ActionController::Base
    # needed for the wishlist
    def wishlist_text
        return @wishlist_exists ? "Remove from Wishlist" : "Add to Wishlist"
    end
    # same as above
    helper_method :wishlist_text
end
