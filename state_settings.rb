STATE_SETTINGS = {
  super: {
    hp_while_init: 120,
    hp_after_attack: ->(original_hp, atk) { original_hp - atk * 0.6 },
    hp_after_rested: ->(original_hp)      { original_hp - 10 }
  },
  normal: {
    hp_while_init: 100,
    hp_after_attack: ->(original_hp, atk) { original_hp - atk * 0.8 },
    hp_after_rested: ->(original_hp)      { original_hp + 10 }
  },
  warning: {
    hp_while_init: 60,
    hp_after_attack: ->(original_hp, atk) { original_hp - atk * 1 },
    hp_after_rested: ->(original_hp)      { original_hp + 40 }
  },
  dying: {
    hp_while_init: 30,
    hp_after_attack: ->(original_hp, atk) { original_hp - atk * 1.5 },
    hp_after_rested: ->(original_hp)      { original_hp * 2 }
  },
  game_over: {
    hp_while_init: 0,
    hp_after_attack: ->(original_hp, atk) { original_hp },
    hp_after_rested: ->(original_hp)      { original_hp }
  },
}
