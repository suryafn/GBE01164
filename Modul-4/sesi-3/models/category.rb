class Category
    attr_reader :id, :name
    def initialize(id, name)
        @id=id
        @name=name
    end

    def self.get_all_categories
        client = create_db_client
        rawData= client.query("select * from categories")
        categories = Array.new
        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            categories.push(category)
        end
        categories
    end

    def insert_category
        client = create_db_client
        client.query("insert into categories(name) values ('#{name}')")
    end

    def delete_category
        client= create_db_client
        client.query("update item_categories set category_id = null where category_id = #{id}")
        client.query("delete from categories where id = #{id}")
    end

    def self.get_category(id)
        client = create_db_client
        rawData= client.query("select * from categories where id = #{id}")
        items = Array.new
        rawData.each do |data|
            item = Category.new(data["id"], data["name"])
            items.push(item)
        end
        items[0]   
    end
    def update_category
        client = create_db_client
        client.query("update categories set name = '#{name}' where id = #{id}")       
    end
end