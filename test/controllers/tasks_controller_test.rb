require "test_helper"

describe TasksController do
  it "should get index" do
    get tasks_index_url
    value(response).must_be :success?
  end

end
