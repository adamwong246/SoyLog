# spec/support/features/session_helpers.rb

module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'

      expect(page).to have_content("You have signed up successfully.")
    end

    def sign_in_as(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign in'

      expect(page).to have_content("Signed in successfully") 
    end

    def sign_in_as_user
      user = create(:user)
      sign_in_as(user.email, user.password)
    end

    def sign_in_as_admin
      user = create(:admin)
      sign_in_as(user.email, user.password)
    end

    def create_nutrient
      create(:nutrient)
    end

  end
end