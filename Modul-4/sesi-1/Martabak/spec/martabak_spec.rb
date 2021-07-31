require '../models/martabak'

describe Martabak do
  it 'check taste chocolate' do
      #given
      martabak = Martabak.new("cokelat")
      #when
      taste = martabak.taste
      #then
      expect(taste).to eq("martabak cokelat is delicious")
  end
  it 'check taste cheese' do
    #given
    martabak = Martabak.new("keju")
    #when
    taste = martabak.taste
    #then
    expect(taste).to eq("martabak keju is delicious")
end
end