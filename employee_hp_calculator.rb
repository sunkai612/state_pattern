module EmployeeHpCalculator
  class FormulaDecider
    def decide_by_state(state)
      state_class = case state
                    when :super     then Super
                    when :normal    then Normal
                    when :warning   then Warning
                    when :dying     then Dying
                    when :game_over then GameOver
                    end

      [state_class.new, state]
    end

    def decide_by_hp(hp)
      state = case hp
              when 101..Float::INFINITY then :super
              when 61..100              then :normal
              when 31..60               then :warning
              when 1..30                then :dying
              else                           :game_over
              end

      decide_by_state(state)
    end
  end

  class Base
    def started
      fail NotImplementedError
    end

    def attacked(_original_hp, _atk)
      fail NotImplementedError
    end

    def rested(_original_hp)
      fail NotImplementedError
    end
  end

  class Super < Base
    def started
      120
    end

    def attacked(original_hp, atk)
      original_hp - atk * 0.6
    end

    def rested(original_hp)
      original_hp - 10
    end
  end

  class Normal < Base
    def started
      100
    end

    def attacked(original_hp, atk)
      original_hp - atk * 0.8
    end

    def rested(original_hp)
      original_hp + 10
    end
  end

  class Warning < Base
    def started
      60
    end

    def attacked(original_hp, atk)
      original_hp - atk * 1
    end

    def rested(original_hp)
      original_hp + 40
    end
  end

  class Dying < Base
    def started
      30
    end

    def attacked(original_hp, atk)
      original_hp - atk * 1.5
    end

    def rested(original_hp)
      original_hp * 2
    end
  end

  class GameOver < Base
    def started
      0
    end

    def attacked(original_hp, atk)
      original_hp
    end

    def rested(original_hp)
      original_hp
    end
  end
end
