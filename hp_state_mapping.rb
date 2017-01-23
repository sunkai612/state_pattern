HP_STATE_MAPPING = ->(hp) do
  case hp
  when 101..Float::INFINITY then :super
  when 61..100              then :normal
  when 31..60               then :warning
  when 1..30                then :dying
  else                           :game_over
  end
end
