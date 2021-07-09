require_relative 'Villain'

class MongolSpearman < Villain
  def initialize(name, hitpoint, attack_damage)
    super(name, hitpoint, attack_damage)
  end

  def attack(other_character)
    puts "#{@name} thrust #{other_character.name} with #{@attack_damage} damage"
    other_character.take_damage(@attack_damage)
  end
end