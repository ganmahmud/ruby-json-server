# test/controllers/application_controller_test.rb

require 'test_helper'
require 'tempfile'

class ApplicationControllerTest < ActionDispatch::IntegrationTest


  setup do
    # Load test data from the existing JSON file
    @original_data = File.read(Rails.configuration.test_data_file_path)
    @test_data = JSON.parse(@original_data)
    @resources_to_test = @test_data.keys
  end

  teardown do
    # Restore the original data after each test
    File.write(Rails.configuration.test_data_file_path, JSON.pretty_generate(@test_data));
  end


  test "SHOULD TEST GET" do

      @resources_to_test.each do |resource_item|
        # Act
        get "/#{resource_item}"

        # Assert
        assert_response :success
        response_json = JSON.parse(response.body)

        # Verify that the response contains the expected number of items
        assert_equal @test_data[resource_item].length, response_json.length
      end

      # Add more specific assertions based on your data
  end


  test 'SHOULD create a new post' do
    post '/posts', params: { application: { 'id' => 4, 'title' => 'New Post', 'author' => 'John Doe' } }
    assert_response :success

    # Parse the response JSON
    response_json = JSON.parse(response.body)

    # Verify that the new item has been added
    assert_equal 'New Post', response_json.last['title']
  end

  test 'SHOULD update an existing post' do
    patch '/posts/1', params: { application: { 'title' => 'Updated Post' } }
    assert_response :success

    # Parse the response JSON
    response_json = JSON.parse(response.body)

    # Verify that the item has been updated
    assert_equal 'Updated Post', response_json['title']
  end

  test 'SHOULD delete an existing post' do
    @resources_to_test.each do |resource_item|
      delete "/#{resource_item}/1"
      assert_response :success

      response_json = JSON.parse(response.body)

      assert_equal "#{resource_item.singularize} item with ID 1 deleted", response_json['message']
    end
  end

end
