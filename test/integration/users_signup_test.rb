require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '', email: 'user@invalid', password: 'foo', password_confirmation: 'bar' } }
    end
    assert_template 'users/new'
    assert_select 'div#form[action="/signup"]'
    assert_select 'div#form[action="/signup"]'
  end

  test "invalid signup information - Name" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '', email: 'user@invalid.com', password: 'foo', password_confirmation: 'foo' } }
    end
    assert_template 'users/new'
  end

  test "invalid signup information - Email" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: 'Matthew', email: 'user@invalidcom', password: 'foo', password_confirmation: 'foo' } }
    end
    assert_template 'users/new'
  end

  test "invalid signup information - Password" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: 'Matthew', email: 'user@invalid.com', password: 'bar', password_confirmation: 'foo' } }
    end
    assert_template 'users/new'
  end

  test "invalid signup information - Password Confirmation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: 'Matthew', email: 'user@invalid.com', password: 'bar', password_confirmation: 'Bar' } }
    end
    assert_template 'users/new'
  end
end
