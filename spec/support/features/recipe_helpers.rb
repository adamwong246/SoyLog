# spec/support/features/session_helpers.rb

module Features
  module RecipeHelpers
    def create_a_recipe
      visit home_path

      click_button 'Create a new Recipe'
      fill_in 'Name', with: "Recipe name"
      fill_in 'Description', with: "Recipe Description... Lorem Ipsum and so forth."

      click_button 'Create Recipe' 
    end
  end
end