def create_product
    message("Iniciando cadastro de produto ...", true, true, 1)
   
    blue_message("Digite o nome do produto",false,false)
    name = gets.chomp
    clear_screen

    blue_message("Digite a descrição do produto (#{green(name)})",false,false)
    description = gets.to_s
    clear_screen

    blue_message("Digite o preço do produto (#{green(name)})",false,false)
    price = gets.to_f
    clear_screen

    blue_message("Digite a quantidade do produto (#{green(name)})",false,false)
    stock = gets.to_i
    clear_screen

    
    p = ProductEntity.new ({
        "id" => Time.now.to_i,
        "name" => name,
        "description" => description,
        "price" => price,
        "stock" => stock
    })

    ProductService.add(p)

    message("O produto #{yellow(name)} foi cadastrado com sucesso!",true,true,3)
end