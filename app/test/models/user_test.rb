require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new name: "User", email: "email@server.com", password: "secret"
  end
  
  test "User validation: must be valid" do
    assert @user.valid?
  end

  test "User validation: must be invalid" do
    @user.name = ''
    assert @user.invalid?
  end
end
