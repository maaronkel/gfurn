class Item < ApplicationRecord
    # devise
    belongs_to :account
    # active storage
    has_one_attached :image
    # this was for a search bar, but atm it doesn't work so ive taken it out. left this here for the future if i want to return to this project
    def self.search(params)
        items = Item.where("title LIKE ? or category LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search.present?]
        items
    end
end
