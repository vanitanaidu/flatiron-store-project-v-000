class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @current_cart = current_user.current_cart
    @items = @current_cart.items
  end

  def checkout
    @items = current_user.current_cart.items
    @items.each do |item|
       item.line_items.each do |line_item|
         item.inventory -= line_item.quantity
        # same as the line above:  item.inventory = (item.inventory - line_item.quantity)
         item.save
         current_user.current_cart.destroy
       end
     end
   end

private

  def cart_params
    params.require(:cart).permit(:user_id)
  end


end
#
# <% if notice %>
#   <p><%= notice %></p>
# <% end %>
#
# <% current_cart.line_items.each do |line_item| %>
#   <p><%= link_to line_item.item.title, item_path(line_item.item) %> | <%= number_to_currency(line_item.item.price) %> | Quantity: <%= line_item.quantity %> | <% if line_item.item.inventory < 5 %>
#     <strong>There are only <%= line_item.item.inventory %> left in stock.</strong>
#   <% end %> </p>
# <% end %>
#
# <p>Order total: <strong><%= number_to_currency(current_cart.total) %></strong> </p>
#
# <%= button_to 'Checkout', checkout_path %>
