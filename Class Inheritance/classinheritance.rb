class Employee
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    add_employees
  end
  
  def bonus(multiplier)
    bonus = (@salary) * multiplier
  end 
  
  def add_employees
    @boss.nil? ? nil : @boss.employees << self
  end
  
  def inspect
    puts "Employee: #{@name}; Boss: #{@boss}"
  end

end

class Manager < Employee
  attr_accessor :employees
  
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end
  
  def bonus(multiplier)
    res = 0
    employees.each { |el| res += el.salary }
    res * multiplier
  end 
  
end 


if __FILE__ == $PROGRAM_NAME 
  ned = Manager.new('ned', 'Founder', 1000000, nil)
  darren = Manager.new('darren', 'TA Manager', 78000, ned)
  shawna = Employee.new('shawna', 'TA', 12000, darren)
  david = Employee.new('david', "TA", 10000, darren)
  p darren.bonus(4)
end 