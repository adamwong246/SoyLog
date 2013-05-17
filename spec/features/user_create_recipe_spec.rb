# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'

feature 'User creates recipe' do
  scenario 'Sign in, new, edit, and destroy Recipe through Show page', js: true do
    
    sign_up_with 'andyadmin@email.com', 'password'
    
    get users_home_path, {}, {'HTTP_REFERER' => :root}



    click_button 'Create a new Recipe'
    fill_in 'Name', with: "test recipe"
    click_button 'Ok'
    expect(page).to have_content("test recipe")

  end

  scenario 'Sign in, create a new Component, sign in as another User, can show but not edit or destroy Recipe', js: true do
    pending "this needs to be implemented"
  end

end