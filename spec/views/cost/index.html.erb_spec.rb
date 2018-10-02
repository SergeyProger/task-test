require "rails_helper"

RSpec.describe '/cost/index.html.erb' do

  before do
    assign(:answer, 'great test!')
    render
  end

  it 'should display the message' do
    expect(rendered).to include 'great test!'
  end
  
end
