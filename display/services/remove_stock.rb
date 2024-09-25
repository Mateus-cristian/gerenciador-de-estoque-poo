require 'terminal-table'

def remove_products
    clear_screen
    message("========= Lista de produtos =========", false, false)

    table = Terminal::Table.new do |t|
        t.headings = ['Id', 'Nome', 'Quantidade de estoque']
        ProductService.all.each do |product|
            t.add_row [product.id, product.name, product.stock]
        end
    end

    puts table

    blue_message("Digite o Id do produto",false, false)
    id = gets.to_i

    product = ProductService.all.find{|p| p.id == id}

    unless product 
        red_message("Produto do id #{id} não encontrado na lista!",false,false)
        yellow_message("Deseja digitar o número novamente? (s/n)",false,false)
        option = gets.chomp.downcase
        clear_screen

        if(option == "s" || option == 'sim')
            remove_products()
        end

        return
    end 

    blue_message("Digite a quantidade que deseja retirar de estoque do produto #{yellow(product.name)}",false,false)
    remove_quantity = gets.to_i
    
    while remove_quantity > product.stock
        red_message("Produto #{product.name} tem o estoque de #{product.stock}. Escolha um valor válido!", false, false)
        blue_message("Digite a quantidade que deseja retirar de estoque do produto #{yellow(product.name)}", false, false)
            remove_quantity = gets.to_i
    end
        
    product.stock = product.stock - remove_quantity
    ProductService.update(product)
    green_message("Retirada realizada com sucesso!", true,true,3)

    show_products
end