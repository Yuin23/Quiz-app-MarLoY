require 'spec_helper'

describe Quiz do
	it {should have_many(:questions)}

	it "should have an error message if title is missing" do
		q=Quiz.new
		q.valid?
		expect(q.errors.full_messages).to include "Title can't be blank"
	end

end

