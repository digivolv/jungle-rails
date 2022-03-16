require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do 
  before :each do
    @category = Category.create! name: 'Apparel'
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "Add to cart" do
    # ACT     
    visit root_path      
    # There are other methods/ways to do the same thing below  


    # VERIFY     
    expect(page).to have_content('My Cart (0)')   
    find_button("Add").trigger("click")
    expect(page).to have_content('My Cart (1)')   


    # DEBUG     
    save_screenshot     
    puts page.html   
end

end
