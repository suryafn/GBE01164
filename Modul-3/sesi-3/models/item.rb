require_relative '../db_connector.rb'

class Item
    attr_reader :id, :name, :price, :category
    def initialize(id, name, price, category=nil)
        @id = id
        @name = name
        @price = price
        @category = category
    end

    def self.get_all_items
        client = create_db_client
        rawData= client.query("select * from items")
        items= Array.new
        rawData.each do |data|
            item = Item.new(data["id"], data["name"], data["price"])
            items.push(item)
        end
        items
    end

    def self.get_all_menu
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

    def self.get_item(id)
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
        items[0]
    end
    def insert_item
        client= create_db_client
        client.query("INSERT INTO items(name, price) VALUES('#{name}', #{price})")
        id = client.last_id
        client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{id}, #{category})")
    end
    
    def update_item
        client= create_db_client
        check = client.query("select * from item_categories where item_id = #{id}")
        puts(check.count)
        if check.count>0
            client.query("update item_categories set category_id = #{category} where item_id = #{id}")    
        else
            client.query("insert into item_categories(item_id, category_id) values  (#{id},#{category})")
        end
        client.query("update items set name = '#{name}', price= #{price} where id = #{id}")
        
    end
    
    def delete_item
        client= create_db_client
        client.query("delete from orders where ItemId = #{id}")
        client.query("delete from item_categories where item_id = #{id}")
        client.query("Delete from items where id = #{id}")    
    end

    def valid?
        return false if @id.nil?
        return false if @name.nil?
        return false if @price.nil?
        return false if @category.nil?
        true
    end
end