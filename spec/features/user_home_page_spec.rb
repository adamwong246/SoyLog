# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'

feature 'User home page' do
  scenario 'Sign in and successfully finds home page' do
    sign_up_with 'valid@example.com', 'password'

    visit users_home_path
  end

  scenario "Don't sign in, Don't find user page" do
    expect { visit users_home_path }.to raise_error
  end

end