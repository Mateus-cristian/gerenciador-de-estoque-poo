class ProductService
    @file = "db/products.json"

    def self.all
        response = JsonRepository.read(@file)
        products = []

        response.each do |product|
            products << ProductEntity.new(product)
        end 
    
        products
    end

    def self.add(product)
        product_hash = self.transform_to_hash(product)
        JsonRepository.add(@file,product_hash)
    end
    
    def self.update(product)
        response = JsonRepository.read(@file)
        
        product_hash = response.find{|data| data["id"] == product.id}
        product_hash["stock"] = product.stock
       

        JsonRepository.update(@file,response)
    end

    private
    def self.transform_to_hash(product)
        product.instance_variables.each_with_object({}) do |var, hash|
            hash[var.to_s.delete("@")] = product.instance_variable_get(var)
        end
    end
end