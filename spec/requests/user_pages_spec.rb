require 'spec_helper'
require 'support/utilities.rb'

describe "User Pages" do
  
  subject { page }

  describe "signup page" do
    before { visit '/signup' }

    it { should have_content('Sign Up') }
    it { should have_title(full_title('Sign up')) }
  end
end
