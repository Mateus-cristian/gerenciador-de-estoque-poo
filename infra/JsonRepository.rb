require 'json'

class JsonRepository

  def self.read(file)
    unless File.exist?(file) 
      puts "O arquivo #{file} não existe"
      return nil
    end

    begin
      json_data = File.read(file) 
      data = JSON.parse(json_data) 
      return data
    rescue JSON::ParserError => e 
      puts "Erro ao analisar o arquivo JSON: #{e}"
      return nil
    end
  end

  def self.update(file,array)
    File.open(file, "w") do |f|   
      f.puts JSON.pretty_generate(array)
    end
  end

  def self.add(file, obj)
    data = self.read(file) || [] 

    data << obj

    self.update(file,data)
  end
  
end
