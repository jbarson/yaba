require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get show" do
    post = posts(:one)
    get post_url(post)
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { "post"=>{"title"=>"hello world", "body"=>"goodbye cruel world"}}
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should get edit" do
    post = posts(:one)
    get edit_post_url(post)
    assert_response :success
  end

  test "should update post" do
    post = posts(:one)
    patch post_url(post), params: { "post"=>{"title"=>"Updated Title", "body"=>"goodbye cruel world"} }
    assert_redirected_to post_url(post)
    post.reload
    assert_equal "Updated Title", post.title
    assert_equal "goodbye cruel world", post.body
  end

  test "should destroy post" do
    post = posts(:one)
    assert_difference('Post.count', -1) do
      delete post_url(post)
    end

    assert_redirected_to root_url
    assert_equal "Post was successfully deleted!", flash[:notice]
  end
end