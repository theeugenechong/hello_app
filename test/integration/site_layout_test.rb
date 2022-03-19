require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end 
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    #test for presence of particular link-URL
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", root_path, count: 2 
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", login_path
    
    get help_path
    assert_select "title", full_title("Help")
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign Up")
    
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    
    get edit_user_path(@user)
    assert_select "title", full_title("Edit User")
    get user_path(@user)
    assert_select "title", full_title(@user.name)
    get users_path
    assert_select "title", full_title("All Users")
  end
end
