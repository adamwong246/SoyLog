# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'
 
feature 'Flags' do
  scenario 'Sign in, create a new Recipe, then flag it', js: true do
    
    admin = sign_in_as_user
    # recipe = create_a_recipe
    # visit components_path

    # find('#new-component').click

    # fill_in 'Name', with: "test component"
    # fill_in 'Url', with: "http://www.something.com/something/else.html"
    # fill_in 'Total amount', with: "1 kg"
    # fill_in 'Price', with: "10.99 $"
    # fill_in 'Serving size', with: "1 g"
    # fill_in 'Nutritional label url', with: "http://www.something.com/something/else/label.jpg"

    # within('#component_nutrients_nested_forms') do
    #     find('.add_nested_fields').click
    #     first_field = all('.fields').first

    #     within(first_field) do
    #         fill_in 'Amount', with: "10 mg"
    #         select nutrient.name
    #     end
    # end

    # click_button 'Create Component'

    # expect(page).to have_content("Component was successfully created.")

  end

  

end
