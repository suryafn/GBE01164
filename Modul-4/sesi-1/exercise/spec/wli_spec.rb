require '../models/wli'

describe Wli do
  it 'check Jacob and Alex' do
      #given
      wli = Wli.new
      wli.names=["Jacob", "Alex"]
      #when
      likes = wli.likes
      #then
      expect(likes).to eq("Jacob and Alex like this")
  end

  it 'check Max, Jhon and Mark' do
    #given
    wli = Wli.new
    wli.names=["Max", "Jhon", "Mark"]
    #when
    likes = wli.likes
    #then
    expect(likes).to eq("Max, Jhon and Mark like this")
   end

   it 'check nothing' do
    #given
    wli = Wli.new
    #when
    likes = wli.likes
    #then
    expect(likes).to eq("no one like this")
   end
   
   it 'check Peter' do
    #given
    wli = Wli.new
    wli.names=["Peter"]
    #when
    likes = wli.likes
    #then
    expect(likes).to eq("Peter like this")
   end
end