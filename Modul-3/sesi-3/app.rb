require 'sinatra'
require_relative 'db_connector'
require_relative 'controllers/item_controller'

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