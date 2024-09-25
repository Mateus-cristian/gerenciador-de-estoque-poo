class ProductEntity

    def initialize(product_hash) 
        self.id = product_hash["id"]
        self.name = product_hash["name"]
        self.description = product_hash["description"]
        self.price = product_hash["price"]
        self.stock = product_hash["stock"]
    end
    
    attr_accessor :id, :name, :description, :price, :stock
end