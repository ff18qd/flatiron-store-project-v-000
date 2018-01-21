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

    def add_item(item)
        
    end 
end
