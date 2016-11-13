require 'simplecov'
SimpleCov.start


require 'rspec'
require_relative 'quicksort'

describe 'Test Quicksort' do

  it 'should sort from lowest to largest' do
    quicksort = Quicksort.new()
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].shuffle
    expect(quicksort.quicksort(array)).to eq([1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12])
  end

  it 'should sort double/float ' do
    quicksort = Quicksort.new()
    array = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9, 10.1, 11.2, 12.3].shuffle
    expect(quicksort.quicksort(array)).to eq([1.1 ,2.2 ,3.3 ,4.4 ,5.5 ,6.6 ,7.7 ,8.8 ,9.9 ,10.1 ,11.2 ,12.3])
  end

  it 'should handle decreasing array ' do
    quicksort = Quicksort.new()
    array = [113434, 100222, 90000, 84029, 82048, 78201, 60281, 59204, 57201, 40281, 29129, 12]
    expect(quicksort.quicksort(array)).to eq([12 ,29129 ,40281 ,57201 ,59204 ,60281 ,78201 ,82048 ,84029 ,90000 ,100222 ,113434])
  end

  it 'should sort double and int' do
    quicksort = Quicksort.new()
    array = [1, 2.9, 3, 4, 5.0, 5.1, 6, 7, 8, 9, 10, 11.00003, 12].shuffle
    expect(quicksort.quicksort(array)).to eq([1, 2.9, 3, 4, 5.0, 5.1, 6, 7, 8, 9, 10, 11.00003, 12])
  end

  it 'should rise Argument error' do
    quicksort = Quicksort.new()
    array = [1, 2.9, 3, 4, 5.0, 'jeden', 'dwa', 'trzy', 'osiem tysiecy', 5.1, 6, 7, 8, 9, 10, 11.00003, 12].shuffle
    expect {quicksort.quicksort(array)}.to raise_error(ArgumentError)
  end

  it 'should do math' do
    quicksort = Quicksort.new()
    array = [1/5, 2.9%2, 3.0/9, 4/8, 5.0, 5.1, 6, 7, 8, 9, 10, 11.00003*334-8, 12-4/10000].shuffle
    expect(quicksort.quicksort(array)).to end_with(11.00003*334-8)
  end

  it 'should get lowest as first' do
    quicksort = Quicksort.new()
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].shuffle
    expect(quicksort.quicksort(array)).to start_with(1)
  end

  it 'should get sort minus and plus numbers' do
    quicksort = Quicksort.new()
    array = 3000.times.map{rand(-1000..1000)}
    array = quicksort.quicksort(array)
    expect(array.at(1)).to be_within(3.1).of(-999)
  end

  it 'should not change the order of already sorted list' do
    quicksort = Quicksort.new()
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    expect(quicksort.quicksort(array)).to eq([1 ,2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12])
  end

  it 'should handle an empty array' do
    quicksort = Quicksort.new()
    array = []
    expect(quicksort.quicksort(array)).to eq(nil)
  end

  it 'should return nil' do
    quicksort = Quicksort.new()
    a, b, ss = 'sodwl'
    array = [(a||b||3||2||94||19)&&ss&&(23||290220203)].shuffle
    puts array
    expect(quicksort.quicksort(array)).to eq(nil)
  end

  it 'should sort strings alone' do
    quicksort = Quicksort.new()
    array = ['b','a','c','d','z','k','Tester','Ruby','2016'].shuffle
    expect(quicksort.quicksort(array)).to eq(["2016", "Ruby", "Tester", "a", "b", "c", "d", "k", "z"])
  end
end