# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'

feature 'User creates recipe' do
  scenario 'Sign in, find home page and create a recipe', js: true do
    
    sign_up_with 'andyadmin@email.com', 'password'
    
    visit users_home_path

    click_button 'Create a new Recipe'
    fill_in 'Name', with: "test recipe"
    click_button 'Ok'
    expect(page).to have_content("test recipe")

  end

end