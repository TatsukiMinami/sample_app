require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_difference 'User.count',1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@invalid.com",
                                         password:              "foofoo",
                                         password_confirmation: "foofoo" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
