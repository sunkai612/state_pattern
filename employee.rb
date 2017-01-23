class Employee
  require "./state_settings"
  require "./hp_state_mapping.rb"

  attr_reader :state, :hp

  def initialize(state: state)
    @state = state
    @hp    = STATE_SETTINGS[state][:hp_while_init]
  end

  def tickets_attack(atk)
    @hp = STATE_SETTINGS[state][:hp_after_attack].(hp, atk)

    update_state!
  end

  def take_break
    @hp = STATE_SETTINGS[state][:hp_after_rested].(hp)

    update_state!
  end

  private

  def update_state!
    @state = HP_STATE_MAPPING.(hp)
  end
end
