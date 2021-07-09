require_relative 'Hero'

class Player < Hero
  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
    @health_restore = 20
  end

  def heal(ally)
    ally.hitpoint += @health_restore
  end
end