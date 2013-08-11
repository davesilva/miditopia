module SpecTestHelper
  include SessionsHelper

  def sign_in_as(user)
    sign_in(user)
  end

  def sign_in_as_user
    sign_in(FactoryGirl.create(:user))
  end
end
