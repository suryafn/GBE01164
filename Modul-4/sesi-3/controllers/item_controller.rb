require_relative '../models/item.rb'
require_relative '../models/category.rb'
class Item_controller
    def list_items
        items = Item.get_all_menu
        renderer = ERB.new(File.read('./views/index.erb'))
        renderer.result(binding)
    end
    def new_item
        categories = Category.get_all_categories
        renderer = ERB.new(File.read('./views/newItem.erb'))
        renderer.result(binding)
    end
    def detail_item(id)
        item = Item.get_item(id)
        renderer = ERB.new(File.read('./views/detail.erb'))
        renderer.result(binding)
    end
    def create_item(name, price, category)
        item = Item.new(id=nil,name, price,category)
        item.insert_item
    end
    def delete_item(id)
        item = Item.new(id,name=nil,price=nil)
        item.delete_item
    end
    def edit_item(id)
        item = Item.get_item(id)
        categories = Category.get_all_categories
        renderer = ERB.new(File.read('./views/edititem.erb'))
        renderer.result(binding)
    end
    def update_item(id, name, price, category)
        item = Item.new(id, name, price, category)
        item.update_item
    end
end