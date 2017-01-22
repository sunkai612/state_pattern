require './employee_type'

class Employee
  attr_reader :employee_type, :hp

  def initialize(state: state)
    @employee_type = EmployeeType.getType(state)
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
                       EmployeeType.getType(:super)
                     elsif hp.between?(61, 100)
                       EmployeeType.getType(:normal)
                     elsif hp.between?(31, 60)
                       EmployeeType.getType(:warning)
                     elsif hp.between?(1, 30)
                       EmployeeType.getType(:dying)
                     elsif hp <= 0
                       EmployeeType.getType(:game_over)
                     end
  end
end
