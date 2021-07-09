require_relative 'Villain'
require_relative 'Hero'
require_relative 'MongolArcher'
require_relative 'MongolSpearman'
require_relative 'MongolSwordsman'
require_relative 'Player'

jin = Player.new('Jin Sakai', 100, 50)
yuna = Hero.new('Yuna', 90, 45)
ishikawa = Hero.new('Sensei Ishikawa', 80, 60)

mongol_archer = MongolArcher.new('Mongol Archer', 80, 40)
mongol_spearman = MongolSpearman.new('Mongol Spearman', 120, 60)
mongol_swordsman = MongolSwordsman.new('Mongol Swordsman', 100, 50)

enemies = [mongol_swordsman, mongol_spearman, mongol_archer]
allies = [yuna, ishikawa]
heroes = [jin, yuna, ishikawa]

i = 1
until jin.is_dead? || enemies.empty?
  allies.each do |ally|
    if ally.is_dead?
      allies.delete(ally)
      next
    end
  end

  enemies.each do |enemy|
    if enemy.is_dead? || enemy.is_fled?
      enemies.delete(enemy)
      next
    end
  end

  puts "========= Turn #{i}  =========\n"
  puts heroes
  puts
  puts enemies
  puts

  puts "As #{jin.name}, what do you want to do this turn?"
  puts '1) Attack an enemy'
  puts '2) Heal an ally'
  choice = gets.chomp.to_i

  case choice
  when 1
    puts 'Which enemy you want to attack?'
    j = 1
    enemies.each do |enemy|
      puts "#{j}) #{enemy.name}"
      j += 1
    end

    which = gets.chomp.to_i
    jin.attack(enemies[which - 1])

  when 2
    puts 'Which ally you want to heal?'
    j = 1
    allies.each do |ally|
      puts "#{j}) #{ally.name}"
      j += 1
    end

    which = gets.chomp.to_i
    jin.heal(allies[which - 1])
  end

  allies.each do |ally|
    if ally.is_dead?
      allies.delete(ally)
      next
    end

    ally.attack(enemies[rand(enemies.size)])
  end

  puts

  enemies.each do |enemy|
    if enemy.is_dead? || enemy.is_fled?
      enemies.delete(enemy)
      next
    end

    enemy.attack(heroes[rand(heroes.size)])
  end

  puts
  i += 1
end