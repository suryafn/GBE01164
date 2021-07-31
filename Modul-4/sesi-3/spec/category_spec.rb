require '../models/category'
require '../models/item'
require '../db_connector'


describe Category do

    describe '#validInitializeCategory' do
        context 'init an category' do
            it 'supposed to be false' do
                category = Category.new(2,'Makanan Korea')
                expect(category.nil?).to eq(false)
            end
        end
    end

    describe '#validSelectAllCategories' do
        context 'select all categories from db' do
            it 'supposed to be false' do
                categories = Category.get_all_categories
                expect(categories.nil?).to eq(false)
            end
        end
    end

    describe '#validSelectACategory' do
        context 'select one category from db' do
            it 'supposed to be false' do
                category = Category.get_category(1)
                expect(category.nil?).to eq(false)
            end
        end

        context 'select one non exist category from db' do
            it 'supposed to be true' do
                category = Category.get_category(100)
                expect(category.nil?).to eq(true)
            end
        end
    end

    describe '#saveCategory' do
        context 'save data to db' do
            it 'input category' do
                category = Category.new(nil,'Makanan Korea')
                category.insert_category
            end
        end
    end

    describe '#deleteCategory' do
        context 'delete data from db' do
            it 'delete category' do
                category = Category.new(6,nil)       
                category.delete_category
            end
        end      
    end
end