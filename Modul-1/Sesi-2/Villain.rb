require_relative 'Person'

class Villain < Person
  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
    @flee_proc = 50
    @fled = false
    @max_hitpoint = hitpoint
  end

  def take_damage(attack_damage)
    @hitpoint -= attack_damage

    if is_dead?
      puts "#{@name} dies"

    elsif @max_hitpoint/@hitpoint == 2 && flee?
      @fled = true
      puts ''
    end
  end

  def flee?
    chance = rand(100)

    if chance < @flee_proc
      puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left"
      return true
    end

    return false
  end

  def is_fled?
    return @fled
  end
end