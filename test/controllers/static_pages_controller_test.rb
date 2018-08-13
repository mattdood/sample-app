require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

  test "should get index" do
    log_in_as users(:michael)
    get users_path
    assert_response :success
    assert_select "title", "All users | #{@base_title}"
  end

  # test "should get edit" do
  #   log_in_as users(:michael)
  #   get edit_user_path(current_user)
  #   assert_response :success
  #   assert_select "title", "Edit user | #{@base_title}"
  # end
  #
  # test "should get profile" do
  #   log_in_as users(:michael)
  #   get current_user
  #   assert_response :success
  #   assert_select "title", "#{@user.name} | #{@base_title}"
  # end

end
