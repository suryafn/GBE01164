class Category
    attr_reader :id, :name
    def initialize(id, name)
        @id=id
        @name=name
    end

    def self.get_all_categories
        client = create_db_client
        rawData= client.query("select * from categories")
        items = Array.new
        rawData.each do |data|
            item = Category.new(data["id"], data["name"])
            items.push(item)
        end
        items
    end
end