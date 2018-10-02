require "rails_helper"

describe TextConvert do

  let!(:cost) { TextConvert.new }

  it 'units' do
    expect(cost.rublej(1)).to eq 'один рубль'
    expect(cost.rublej(2)).to eq 'два рубля'
    expect(cost.rublej(6)).to eq 'шесть рублей'
  end

  it 'dozens of' do
    expect(cost.rublej(10)).to eq 'десять рублей'
  end

  it 'hundreds' do
    expect(cost.rublej(101)).to eq 'сто один рубль'
    expect(cost.rublej(564)).to eq 'пятьсот шестьдесят четыре рубля'
    expect(cost.rublej(976)).to eq 'девятьсот семьдесят шесть рублей'
  end

  it 'thousands of' do
    expect(cost.rublej(1000)).to eq 'одна тысяча рублей'
    expect(cost.rublej(1100)).to eq 'одна тысяча сто рублей'
    expect(cost.rublej(96756)).to eq 'девяносто шесть тысяч семьсот пятьдесят шесть рублей'
  end

  it 'millions of' do
    expect(cost.rublej(9999999)).to eq 'девять миллионов девятьсот девяносто девять тысяч девятьсот девяносто девять рублей'
  end


end