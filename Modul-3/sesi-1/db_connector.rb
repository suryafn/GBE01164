require 'mysql2'
require_relative 'models/item'
require_relative 'models/category'
def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "",
        :database => "food_oms_db"
    )
    
    client
end

def get_all_items
    client = create_db_client
    rawData= client.query("select * from items")
    items= Array.new
    rawData.each do |data|
        item = Item.new(data["id"], data["name"], data["price"])
        items.push(item)
    end
    items
    
end
def get_all_categories
    client = create_db_client
    rawData= client.query("select * from categories")
    items = Array.new
    rawData.each do |data|
        item = Category.new(data["id"], data["name"])
        items.push(item)
    end
    items
end

def get_all_menu
    client = create_db_client
    rawData= client.query("select items.id, items.name, items.price, categories.name as 'category', categories.id as 'categories_id'from items left join item_categories on item_categories.item_id = items.id left join categories on categories.id = item_categories.category_id;")
    items = Array.new
    rawData.each do |data|
        if data["category"] != "NULL"
            category = Category.new(data["categories_id"], data["category"])
        else
            category = nil
        end
        item = Item.new(data["id"], data["name"], data["price"], category)
        items.push(item)
    end
    items
end
def get_item(id)
    client = create_db_client
    rawData= client.query("select items.id, items.name, items.price, categories.name as 'category', categories.id as 'categories_id'from items left join item_categories on item_categories.item_id = items.id left join categories on categories.id = item_categories.category_id where items.id = #{id};")
    items = Array.new
    rawData.each do |data|
        if data["category"] != "NULL"
            category = Category.new(data["categories_id"], data["category"])
        else
            category = nil
        end
        item = Item.new(data["id"], data["name"], data["price"], category)
        items.push(item)
    end
    items
end
def insert_item(name, price, category)
    client= create_db_client
    client.query("INSERT INTO items(name, price) VALUES('#{name}', #{price})")
    id = client.last_id
    client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{id}, #{category})")
end
all_items = get_all_menu
all_items.each do |item|
    puts(item.id.to_s + ' ' + item.name + ' '+item.price.to_s+' '+item.category.to_s)
end
# puts(get_all_categories[0])
# puts(get_all_menu.each)
# price = gets.to_i
# puts(get_all_item(price).each)