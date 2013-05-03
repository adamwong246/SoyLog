# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'

feature 'User signs up' do
  
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Sign out')

  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content('Sign in')
    
  end 


end
