require '../models/category'
require '../models/item'
require '../db_connector'


describe Item do

    describe '#validInitializeItem' do
        context 'init an item' do
            it 'supposed to be true' do
                item = Item.new(1,'Andaliman bakar', 200000, Category.new(1, 'beverage') )
                expect(item.valid?).to eq(true)
            end
        end
    end

    describe '#validSelectAllItems' do
        context 'select all items from db' do
            it 'supposed to be false' do
                item = Item.get_all_items
                expect(item.nil?).to eq(false)
            end
        end
    end

    describe '#validSelectAnItem' do
        context 'select one item from db' do
            it 'supposed to be true' do
                item = Item.get_item(9)
                expect(item.valid?).to eq(true)
            end
        end

        context 'select one non exist item from db' do
            it 'supposed to be true' do
                item = Item.get_item(1)
                expect(item.nil?).to eq(true)
            end
        end
    end

    describe '#saveItem' do
        context 'save data to db' do
            it 'input item' do
                category = Category.get_category(2)
                item = Item.new(nil,'Andaliman bakar', 200000, category.id )
                item.insert_item
            end
        end
    end

    describe '#deleteItem' do
        context 'delete data from db' do
            it 'delete item' do
                item = Item.new(1,name=nil,price=nil)
                item.delete_item
            end
        end      
    end
end