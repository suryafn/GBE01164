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

  def attack(other_person)
    puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
    other_person.take_damage(@attack_damage)
  end

  def take_damage(attack_damage)
    if @name == "Jin Sakai" && deflect?
      return
    end

    @hitpoint -= attack_damage
  end

  def is_dead?
    is_dead = false
    if @hitpoint <= 0
      is_dead = true
    end
    if is_dead == false
      puts "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage\n\n"
      return false
    else
      puts "#{@name} dies\n\n" if @hitpoint <= 0
      return true
    end
  end

  def deflect?
    probs = rand()

    if probs < 0.8
      # puts probs
      puts "#{@name} deflects the attack."
      return true
    end

    return false
  end
end
