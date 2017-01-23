require "pry"
require "./employee_hp_calculator.rb"

class Employee
  attr_reader :hp_calculator, :state, :hp

  def initialize(state: state)
    @hp_calculator, @state = EmployeeHpCalculator::FormulaDecider.new.decide_by_state(state)
    @hp                    = hp_calculator.started
  end

  def tickets_attack(atk)
    @hp = hp_calculator.attacked(hp, atk)

    update_hp_calculator_by_hp!
  end

  def take_break
    @hp = hp_calculator.rested(hp)

    update_hp_calculator_by_hp!
  end

  private

  def update_hp_calculator_by_hp!
    @hp_calculator, @state = EmployeeHpCalculator::FormulaDecider.new.decide_by_hp(hp)
  end
end
