require '../controllers/category_controller'
require 'mysql2'
describe Category_controller do
    describe '#Show' do
        describe 'show all categories' do
            it 'showing page with list categories' do
                controller = Category_controller.new
                response = controller.list_categories
                expected_view = ERB.new(File.read('views/listCategories.erb'))
                expect(response).to eq(expected_view.result)
            end
        end
        describe 'show edit category' do
            it 'showing edit page' do
                controller = Category_controller.new
                response = controller.edit_category(1)
                expected_view = ERB.new(File.read('views/editcategory.erb'))
                expect(response).to eq(expected_view.result)
            end
        end
        describe 'show new category' do
            it 'showing add new category page' do
                controller = Category_controller.new
                response = controller.edit_category(1)
                expected_view = ERB.new(File.read('views/newcategory.erb'))
                expect(response).to eq(expected_view.result)
            end
        end
    end

end