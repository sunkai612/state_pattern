require './employee_type'

class Employee
  attr_reader :employee_type, :hp

  def initialize(state: state)
    @employee_type = EmployeeType.new(state)
    @hp            = employee_type.init_hp
  end

  def state
    employee_type.display_name
  end

  def tickets_attack(atk)
    @hp = employee_type.tickets_attack(hp, atk)
    update_employee_type!
  end

  def take_break
   @hp =  employee_type.take_break(hp)
   update_employee_type!
  end

  private

  def update_employee_type!
    @employee_type = if hp > 100
                       EmployeeType.new(:super)
                     elsif hp.between?(61, 100)
                       EmployeeType.new(:normal)
                     elsif hp.between?(31, 60)
                       EmployeeType.new(:warning)
                     elsif hp.between?(1, 30)
                       EmployeeType.new(:dying)
                     elsif hp <= 0
                       EmployeeType.new(:game_over)
                     end
  end
end
