
class Cart < ActiveRecord::Base

  belongs_to :user

  has_many :line_items
  has_many :items, through: :line_items

  def total
  
    self.items.each do |item|
      item.price
    end
  end
end
