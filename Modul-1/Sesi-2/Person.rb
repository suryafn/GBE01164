class Person
  attr_reader :name, :attack_damage, :hitpoint

  def initialize(name, hitpoint, attack_damage)
    @name = name
    @hitpoint = hitpoint
    @attack_damage = attack_damage
  end

  def to_s
    "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage\n\n"
  end

  def is_dead?
    return true if @hitpoint <= 0
    return false
  end

end
