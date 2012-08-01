require 'spec_helper'

describe User do
  before(:each) do
        @user = Factory(:user)
        sign_in @user
  end
  
end