require 'json'

class JsonRepository

  def self.read(file)
    unless File.exist?(file)  # Verifica se o arquivo existe
      puts "O arquivo #{file} não existe"
      return nil
    end

    begin
      json_data = File.read(file)  # Lê o conteúdo do arquivo
      data = JSON.parse(json_data) # Faz o parse do JSON
      return data
    rescue JSON::ParserError => e  # Trata erros ao analisar o JSON
      puts "Erro ao analisar o arquivo JSON: #{e}"
      return nil
    end
  end

  def self.add(file, obj)
    data = self.read(file) || []  # Lê o arquivo ou cria uma lista vazia

    data << obj

    File.open(file, "w") do |f|   # Escreve os dados atualizados no arquivo
      f.puts JSON.pretty_generate(data)
    end
  end
end
