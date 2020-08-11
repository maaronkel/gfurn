class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :properties
  has_many :items
  # Wishlist
  has_many :wishlist_items
  has_many :wishlists, through: :wishlist_items, source: :item
end
