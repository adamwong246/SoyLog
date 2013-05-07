# spec/features/visitor_signs_up_spec.rb
require 'spec_helper'
 
feature 'User adds new Component' do
  scenario 'Sign in, create a new Component, success', js: true do
    
    sign_up_with 'andyadmin@email.com', 'password'

    nutrient = create_nutrient

    visit components_path

    find('#new-component').click

    fill_in 'Name', with: "test component"
    fill_in 'Url', with: "http://www.something.com/something/else.html"
    fill_in 'Total amount', with: "1 kg"
    fill_in 'Price', with: "10.99 $"
    fill_in 'Serving size', with: "1 g"
    fill_in 'Nutritional label url', with: "http://www.something.com/something/else/label.jpg"

    within('#component_nutrients_nested_forms') do
        find('.add_nested_fields').click
        first_field = all('.fields').first

        within(first_field) do
            fill_in 'Amount', with: "10 mg"
            select nutrient.name
        end
    end

    click_button 'Create Component'

    expect(page).to have_content("Component was successfully created.")
  end

  scenario 'Sign in, create a new Component without attributes, fails', js: true do
    
    sign_up_with 'andyadmin@email.com', 'password'

    nutrient = create_nutrient

    visit new_component_path

    # Don't fill anything in!

    click_button 'Create Component'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Url can't be blank")
    expect(page).to have_content("Total amount can't be blank")
    expect(page).to have_content("Price can't be blank")
    expect(page).to have_content("Serving size can't be blank")
    expect(page).to have_content("Component nutrients can't be blank")
  end

  scenario 'Sign in, create a new Component without invalid urls, fails', js: true do
    
    sign_up_with 'andyadmin@email.com', 'password'

    nutrient = create_nutrient

    visit new_component_path

    fill_in 'Url', with: "This is not a valid url"
    fill_in 'Nutritional label url', with: "This is not a valid url either"

    click_button 'Create Component'

    expect(page).to have_content("Url is invalid")
    expect(page).to have_content("Nutritional label url is invalid")
  end

  scenario 'Sign in, create a new Component with invalid Units, fails', js: true do
    
    sign_up_with 'andyadmin@email.com', 'password'

    nutrient = create_nutrient

    visit new_component_path

    fill_in 'Total amount', with: "This is an improper unit"
    fill_in 'Serving size', with: "This also an improper units"
    fill_in 'Price', with: "Not even wrong!"

    click_button 'Create Component'

    expect(page).to have_content("Total amount must be a proper unit")
    expect(page).to have_content("Serving size must be a proper unit")
  end

  scenario 'Sign in, create a new Component with duplicate Nutrients, fails', js: true do
    
    sign_up_with 'andyadmin@email.com', 'password'

    nutrient = create_nutrient

    visit new_component_path

    within('#component_nutrients_nested_forms') do
      find('.add_nested_fields').click
      find('.add_nested_fields').click

      within(all('.fields')[0]) do
        fill_in 'Amount', with: "10 mg"
        select nutrient.name
      end

      within(all('.fields')[1]) do
        fill_in 'Amount', with: "10 mg"
        select nutrient.name
      end
    end

    click_button 'Create Component'

    expect(page).to have_content("Can't have duplicate Nutrients")
  end

end
