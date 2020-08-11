class AccountWishlist < ApplicationRecord
  belongs_to :item
  # devise
  belongs_to :account
end
