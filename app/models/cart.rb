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
        line_item = line_items.find_by(item_id: itemid)
        if line_item
        # if items.ids.include?(itemid)
            # binding.pry
            line_item.update(quantity: (line_item.quantity + 1))
            
            line_item
        else 
            line_items.build(cart_id: self.id, item_id: itemid)
        end 
    end 
    
    def checkout
        # binding.pry
        self.line_items.each do |line_item|
            quantity = line_item.quantity
            line_item.item.inventory = line_item.item.inventory - quantity
            line_item.item.save
        end 
        self.status = "submitted"
    end 
    
end
