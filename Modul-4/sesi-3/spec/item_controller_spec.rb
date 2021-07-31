require '../controllers/item_controller'
require 'mysql2'
describe Item_controller do
    describe '#Show' do
        describe 'show all items' do
            it 'showing page with list items' do
                controller = Item_controller.new
                response = controller.list_items
                expected_view = ERB.new(File.read('views/index.erb'))
                expect(response).to eq(expected_view.result)
            end
        end
        describe 'show edit item' do
            it 'showing edit page' do
                controller = Item_controller.new
                response = controller.edit_item(1)
                expected_view = ERB.new(File.read('views/edititem.erb'))
                expect(response).to eq(expected_view.result)
            end
        end
        describe 'show new item' do
            it 'showing add new item page' do
                controller = Item_controller.new
                response = controller.new_item
                expected_view = ERB.new(File.read('views/newItem.erb'))
                expect(response).to eq(expected_view.result)
            end
        end
        describe 'show detail item' do
            it 'showing detail item page' do
                controller = Item_controller.new
                response = controller.detail_item(1)
                expected_view = ERB.new(File.read('views/detail.erb'))
                expect(response).to eq(expected_view.result)
            end
        end
    end

end