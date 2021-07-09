require_relative 'Person'

class Hero < Person
  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
    @deflect_proc = 80
  end

  def take_damage(attack_damage)
    if deflect?
      puts "#{@name} deflects the attack."
      return
    end

    if is_dead?
      puts "#{@name} dies"
      return
    end

    @hitpoint -= attack_damage
    puts "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
  end

  def attack(enemy)
    puts "#{@name} attacks #{enemy.name} with #{@attack_damage} damage"
    enemy.take_damage(@attack_damage)
  end

  def deflect?
    chance = rand(100)

    return true if chance < @deflect_proc
    return false
  end
end