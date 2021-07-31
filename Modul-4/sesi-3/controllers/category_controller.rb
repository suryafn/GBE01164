require_relative '../models/category.rb'

class Category_controller
    def list_categories
        categories = Category.get_all_categories
        renderer = ERB.new(File.read('./views/listCategories.erb'))
        renderer.result(binding)
    end

    def new_category
        renderer = ERB.new(File.read('./views/newcategory.erb'))
        renderer.result(binding)
    end

    def create_category(name)
        category = Category.new(id=nil, name)
        category.insert_category        
    end
    
    def delete_category(id)
        category = Category.new(id, name=nil)
        category.delete_category
    end

    def edit_category(id)
        category = Category.get_category(id)
        renderer = ERB.new(File.read('./views/editcategory.erb'))
        renderer.result(binding)        
    end

    def update_category(id,name)
        category = Category.new(id, name)
        category.update_category
        
    end
end