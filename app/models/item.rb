class Item < ActiveRecord::Base

  belongs_to :category

  has_many :line_items
  has_many :carts, through: :line_items


  def self.available_items
    binding.pry
    if self.inventory = 0

    end
  end


end
