require "test_helper"

class PostReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get rate" do
    get post_reviews_rate_url
    assert_response :success
  end
end
