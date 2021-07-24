require 'sinatra'
require_relative 'db_connector'
require_relative 'controllers/item_controller'
require_relative 'controllers/category_controller'

get '/' do
    controller = Item_controller.new
    controller.list_items
end

get '/items/new' do
    controller = Item_controller.new
    controller.new_item
end

post '/items/create' do
    name = params['name']
    category = params['category']
    price = params['price']
    controller = Item_controller.new
    controller.create_item(name,price,category)
    redirect '/'
end

get '/items/:id/detail' do
    id = params["id"]
    controller = Item_controller.new
    controller.detail_item(id)
end

post '/items/delete/:id' do
    id = params["id"]
    controller = Item_controller.new
    controller.delete_item(id)
    redirect '/'
end

get '/items/edit/:id' do
    id = params["id"]
    controller = Item_controller.new
    controller.edit_item(id)
end

post '/items/update/:id' do
    id = params['id']
    name = params['name']
    category = params['category']
    price = params['price']
    controller = Item_controller.new
    controller.update_item(id, name, price, category)
    redirect '/'
end

get '/categories' do
   controller = Category_controller.new
   controller.list_categories
end

get '/categories/new' do
    controller = Category_controller.new
    controller.new_category
end

post '/category/create' do
    name = params['name']
    controller = Category_controller.new
    controller.create_category(name)
    redirect '/categories'
end

post '/categories/delete/:id' do
    id = params["id"]
    controller = Category_controller.new
    controller.delete_category(id)
    redirect '/categories'
end

get '/categories/edit/:id' do
    id = params["id"]
    controller = Category_controller.new
    controller.edit_category(id)
end

post '/category/update/:id' do
    id = params["id"]
    name = params["name"]
    controller = Category_controller.new
    controller.update_category(id, name)
    redirect '/categories'
end