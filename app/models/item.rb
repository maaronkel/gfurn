class Item < ApplicationRecord
    belongs_to :account
    has_one_attached :image
    def self.search(params)
        items = Item.where("title LIKE ? or category LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search.present?]
        items
    end
end
