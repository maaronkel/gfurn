class AccountWishlist < ApplicationRecord
  belongs_to :item
  belongs_to :account
end
