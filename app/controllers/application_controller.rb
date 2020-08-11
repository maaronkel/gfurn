class ApplicationController < ActionController::Base
    def wishlist_text
        return @wishlist_exists ? "Remove from Wishlist" : "Add to Wishlist"
    end

    helper_method :wishlist_text
end
