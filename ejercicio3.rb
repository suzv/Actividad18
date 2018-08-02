r = (1..10).to_a

class Roulette
  def initialize(r)
    @r = (1..10).to_a
  end
  def play(num)
    @num = num
    @jugar = @r[rand(0..9)]
    guardar(@jugar)
    ganador(@jugar) if @jugar == @num
  end
  def guardar(file)
    file = File.open('roulette_history.txt', 'a')
    file.puts @num
    file.close
  end
  def ganador(file)
    file = File.open('winners.txt', 'a')
    file.puts "has ganado con el numero: ", @num
    file.close
  end

end



Roulette.new(r).play(9)


data = []
file = File.open('roulette_history.txt', 'r')
data = file.readlines.map(&:chomp)
file.close
print data.group_by{ |i| i}.max{|x,y| x[1].length <=> y[1].length }.first
