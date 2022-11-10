require 'test_helper'

class RecipeFoodsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get recipe_foods_create_url
    assert_response :success
  end

<<<<<<< HEAD
  test 'should get destroy' do
=======
  test "should get destroy" do
>>>>>>> 968072e7ba15efd8c511b3a29e1ccbededbc1390
    get recipe_foods_destroy_url
    assert_response :success
  end
end
