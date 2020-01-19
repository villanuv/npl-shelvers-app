require 'rails_helper'

describe "Creating a New Cart" do

	it "saves and displays new cart" do
		visit '/users/sign_in'

		

		visit '/carts/new'



		click_on 'Create New Cart'


		expect(page).to have_content("Yo")
	end

end