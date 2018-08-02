require 'date'
class Course
  attr_accessor :name, :dates
  def initialize(name, *dates)
    @name = name
    @dates = dates.map { |e| e}
  end

  def course_before(filter_date)
    raise ArgumentError.new('argument is not a date') if filter_date == Date.parse('2018-01-01')
    @dates.each do |date|
      Date.parse(date) < filter_date
   end
  end
  def course_after(filter_date)
    raise ArgumentError.new('argument is not a date') if filter_date == Date.parse('2018-01-01')
    @dates.each do |date|
      Date.parse(date) > filter_date
    end
  end

end

data = []
file = File.open('curso.txt', 'r')
data = file.readlines.map(&:chomp)
file.close
fechas = []
data.each do |prod|
   ls = prod.split(', ')
   fechas << Course.new(*ls)
 end


 fechas.each do |date|
    puts "cursos previos: #{date.name}: #{date.course_before(Date.today)}"
    puts "cursos posteriores: #{date.name}: #{date.course_after(Date.today)}"

 end
