require 'rspec'
require 'tdd'

describe "my_uniq" do
    subject(:array) { [1, 1, 3, 1, 5] }

    it 'should take in an Array' do
        expect(array).to be_instance_of(Array)
        my_uniq(array)
    end

    it 'should return an Array' do
        expect(my_uniq(array)).to be_instance_of(Array)
    end

    it 'should return a new Array' do
        expect(my_uniq(array)).not_to be(array)
    end

    it 'should return unique elements' do
        expect(my_uniq(array)).to eq(array.uniq)
    end

    it 'should return elements in the order they first appeared' do
        expect(my_uniq(array)).to eq([1, 3, 5])
    end

end

describe "Array#two_sum" do

    it 'should return an array of pairs of positions where the elements at those positions sum to zero' do
        array = [-1, 0, 2, -2]
        expect(array.two_sum).to eq([[2, 3]])
    end

    it 'should return unique pairs sorted smaller index before bigger index ([0, 2] before [2, 1])' do
        array = [-1, 0, 2, -2, 1]
        expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'should return the array of pairs sorted dictionary-wise ([0, 1] before [0, 2])' do
        array = [-1, 0, 2, -2, 1, 1]
        expect(array.two_sum).to eq([[0, 4], [0, 5], [2, 3]])
    end

    it 'should return an empty array when no pairs are found' do
        array = [0, 1, 2, 3]
        expect(array.two_sum).to eq([])
    end
end

describe "my_transpose" do
    subject(:array) { [[0, 1, 2],[3, 4, 5],[6, 7, 8]] }
    it 'should convert rows to columns (my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]]) => [[0, 3, 6], [1, 4, 7], [2, 5, 8]]' do
        expect(my_transpose(array)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end

    it 'should not mutate the original array' do
        my_transpose(array)
        expect(array).to eq([[0, 1, 2],[3, 4, 5],[6, 7, 8]])
    end
end

describe "stock_picker" do
    let(:array) { [20, 22, 25, 20, 19, 18, 22, 26, 29, 17] }

    it 'should return a pair of elements whose difference is the largest' do
        expect(stock_picker(array)).to eq([5, 8])
    end

    it 'should return the largest difference between the later element and the earlier element' do
        expect(stock_picker(array)).to eq([5, 8])
    end

    it 'should not mutate the original array' do
        stock_picker(array)
        expect(array).to eq([20, 22, 25, 20, 19, 18, 22, 26, 29, 17])
    end
end

describe Towers_of_Hanoi do
    subject(:game) { Towers_of_Hanoi.new }

    describe "#initialize" do
        it "creates an array containing three arrays" do
            expect(game.rods).to be_instance_of(Array)
            expect(game.rods[0]).to be_instance_of(Array)
            expect(game.rods.length).to eq(3)
        end

        it "populates one array with disks and leaves the other two empty" do
            expect(game.rods[0]).to eq([3, 2, 1])
            expect(game.rods[1]).to eq([])
            expect(game.rods[2]).to eq([])
        end
    end

    describe "#valid_move?" do
        before(:each) { game.rods = [[3, 2], [1], []] }

        it "raises 'You must stack smaller on top of larger disks' error if " do
            expect { game.valid_move?(0, 1) }.to raise_error("You must stack smaller on top of larger disks")
        end

        it "raises 'You must move a disk to a different pile' if " do
            expect { game.valid_move?(0,0) }.to raise_error("You must move a disk to a different pile")
        end
    end

    describe "#move" do
        before(:each) { game.move(0, 1) }

        it 'takes the last item in the start array and moves it to the end of the destination array' do
            expect(game.rods).to eq([[3, 2], [1], []])
        end
    end

    describe "#won" do
        
        it "checks the length of the second and third arrays if equivalent to 3" do
            game.rods = [[3, 2], [1], []]
            expect(game.won).to eq(false)
            game.rods = [[], [3, 2, 1], []]
            expect(game.won).to eq(true)
            game.rods = [[3, 2, 1], [], []]
            expect(game.won).to eq(false)
        end
    end

end