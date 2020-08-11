class Item < ApplicationRecord
    belongs_to :account
    has_many :wishlist_items
    has_many :wishlist_by, through: :wishlist_items, source: :account
    has_one_attached :image
    def self.search(params)
        items = Item.where("title LIKE ? or category LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search.present?]
        items
    end
end
