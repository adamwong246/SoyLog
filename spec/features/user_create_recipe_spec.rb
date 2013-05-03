# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'

feature 'User creates recipe' do
  scenario 'Sign in, find home page and create a recipe' do
    
    sign_up_with 'valid@example.com', 'password'
    visit users_home_path

    find("#new-recipe-link").click
    fill_in 'Name', with: email
    click_button 'Ok'

  end



end