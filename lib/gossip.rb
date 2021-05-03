require 'pry'
require 'csv'

class Gossip
  attr_accessor :author , :content
  def initialize (author, content)
    @author = author
    @content = content
  end
  
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    puts "bonjour ceci est l'id #{id}"
    indice = 1
     CSV.foreach("./db/gossip.csv") do | row |
      #puts "#{row}, numéro de ligne : #{row_number}" 
      puts "ceci est le row stp #{row}"

      if (indice == id.to_i)
        puts "numéro trouvé #{row}"
        return Gossip.new(row[0], row[1]) # on crée une nouvelle instance

      end
      indice = indice + 1
    end
  end
end