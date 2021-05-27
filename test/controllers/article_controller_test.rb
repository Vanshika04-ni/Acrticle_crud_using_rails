require "test_helper"

class ArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get article_home_url
    assert_response :success
  end
end
