class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items
    
    def total 
        # binding.pry
        result = 0
        self.line_items.each do |item|
            
            price = Item.find(item.item_id).price
            quantity = item.quantity
            
            result = result + price * quantity
        end 
        result
    end 

    def add_item(itemid)
        # binding.pry
        line_item = line_items.find_by(item_id: itemid)
        if items.ids.include?(itemid)
        
            line_item.update(quantity: (line_item.quantity + 1))
            line_item
        else 
            line_items.new(cart_id: self.id, item_id: itemid)
        end 
    end 
end
