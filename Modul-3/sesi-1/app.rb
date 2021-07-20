require 'sinatra'
require_relative 'db_connector'


get '/' do
    items = get_all_menu

    erb :index, locals: {
        items: items
    }
end

get '/items/new' do
    categories = get_all_categories
    erb :newItem, locals: {
        categories: categories
    }
end

post '/items/create' do
    name = params['name']
    category = params['category']
    price = params['price']
    insert_item(name, price, category)
    redirect '/'
end

get '/items/:id/detail' do
    id = params["id"]
    item = get_item(id)[0]
    erb :detail, locals:{
        item: item
    }
end

post '/items/delete/:id' do
    id = params["id"]
    delete_item(id)
    redirect '/'
end

get '/items/edit/:id' do
    id = params["id"]
    categories = get_all_categories
    item = get_item(id)[0]
    erb :edititem, locals:{
        item: item,
        categories: categories
    }
end

post '/items/update/:id' do
    id = params['id']
    name = params['name']
    category = params['category']
    price = params['price']
    update_item(id, name, price, category)
    redirect '/'
end