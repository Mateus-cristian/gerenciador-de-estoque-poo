require 'terminal-table'

def show_products
    clear_screen
    message("========= Lista de produtos =========", false, false)

    table = Terminal::Table.new do |t|
        t.headings = ['Id', 'Nome', 'Descrição', 'Preço', 'Quantidade de estoque']
        ProductService.all.each do |product|
            t.add_row [product.id, product.name, product.description, product.price, product.stock]
        end
    end

    puts table

    message("\n", false, false)
end