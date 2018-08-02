
class Table
  attr_accessor :name, :income

  def initialize(name, *income)
    @name = name
    @income = income.map(&:to_f)

  end



  def mostrar(mesas)
    mesas.each do |valor|
    var = valor.income
    var = var.index(var.max).to_i
    var = var +1
    print "#{valor.name}: #{valor.income.max}, día: #{var} "
   end
  end

  def average
    puts "\n"
    print @income.inject(&:+) / @income.size
  end
end

data = []
file = File.open('casino.txt', 'r')
data = file.readlines.map(&:chomp)
file.close
mesas = []

data.each do |prod|
   ls = prod.split(', ')
   mesas << Table.new(*ls)
 end



 mesas.last.mostrar(mesas)


 mesas.last.average



 # mesas.each do |valor|
 #    puts "#{valor.name}: #{valor.average}"
 #  end
