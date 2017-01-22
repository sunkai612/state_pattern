require 'pry'
require 'minitest/autorun'
require_relative '../employee'

describe Employee do

  it 'response correct init hp' do
    [[:super, 120], [:normal, 100], [:warning, 60], [:dying, 30], [:game_over, 0]].each do | state, expect_hp |
      assert_equal expect_hp, Employee.new(state: state).hp
    end
  end

  it 'response correct hp after tickets attack' do
    [[:super,     90,  :normal],
     [:normal,    60,  :warning],
     [:warning,   10,  :dying],
     [:dying,     -45, :game_over],
     [:game_over, 0,   :game_over]
    ].each do | state, expect_hp, expect_state |

      employee = Employee.new(state: state)
      employee.tickets_attack(50)

      assert_equal expect_hp, employee.hp
      assert_equal expect_state, employee.state
    end
  end

  it 'response correct hp after take break' do
    [[:super,     110, :super],
     [:normal,    110, :super],
     [:warning,   100, :normal],
     [:dying,     60,  :warning],
     [:game_over, 0,   :game_over]
    ].each do | state, expect_hp, expect_state |

      employee = Employee.new(state: state)
      employee.take_break

      assert_equal expect_hp, employee.hp
      assert_equal expect_state, employee.state
    end
  end
end
