require "rspec"
require_relative "task"
require_relative "list"

describe List do
	# Your specs here
	let(:title1) { "Attend Next Academy" }
	let(:tasks1) { [Task.new("Coding"), Task.new("More Coding")] }
	let(:list1) { List.new(title1, tasks1) }
	let(:title2) { "Holiday" }
	let(:list2) {List.new(title2)}

	describe "#initialize" do
		it "takes a title and an array of tasks as arguments" do
		  list = List.new(title1, tasks1)
		  expect(list).to be_a_kind_of(List)
		  expect(list.title).to eq('Attend Next Academy')
		  expect(list.tasks.count).to eq(2)
		end

	    it "requires at least one argument" do
	      expect { List.new }.to raise_error(ArgumentError)
	    end

	    it "has an empty tasks array when only passed in title" do
	      list = List.new(title2)
	      expect(list.tasks.count).to eq(0)
	    end
	end

	describe "#add_task" do
		it "adds a task to the array of tasks" do
			task = Task.new("Wash dad's car")
			list2.add_task(task)
			expect(list2.tasks.count).to eq(1)
			expect(list2.tasks.last.description).to eq("Wash dad's car")
		end
	end

	describe "#complete_task" do
		it "completes the task in the list" do
			list1.complete_task(0)
			expect(list1.tasks[0].complete?).to be true
		end
	end

	describe "when complete_task with invalid index" do
		it "will output error message" do
		  expect(list1.complete_task(5)).to eq('Index out of range!')
		end
	end

	describe "#delete_task" do
		it "completes the task in the list" do
			list1.delete_task(0)
			expect(list1.tasks.count).to eq(1)
		end
	end

	describe "when complete_task with invalid index" do
		it "will output error message" do
		  expect(list1.delete_task(5)).to eq('Index out of range!')
		end
	end

	describe "#completed_tasks" do
		it "checks number of completed tasks in the list" do
			list1.complete_task(0)
			expect(list1.completed_tasks.count).to eq(1)
		end
	end

	describe "#incomplete_tasks" do
		it "checks number of incomplete tasks in the list" do
			expect(list1.incomplete_tasks.count).to eq(2)
		end
	end
end