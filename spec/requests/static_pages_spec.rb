require 'spec_helper'

describe "Static pages" do
	let(:base_title) { "BADPHOTO" }

	subject { page }

	describe "Home page" do
		before { visit root_path }

		it { should have_content('BADPHOTO') }
		it { should have_title(full_title('')) }
		it { should_not have_title('| Home') }

	end

	describe "About page" do
		before { visit about_path }

		it { should have_content('About') }
		it { should have_title(full_title('About'))}

	end

	describe "Contact page" do
		before { visit contact_path }

		it { should have_content('Contact') }
		it { should have_title(full_title('Contact'))}
	end

	describe "LA page" do
		before { visit la_path }

		it { should have_content('LA') }
		it { should have_title(full_title('LA')) }
	end

	describe "Model Tests page" do
		before { visit modelTests_path }

		it { should have_content('Model Tests') }
		it { should have_title(full_title('Model Tests')) }
	end

	describe "NYC page" do
		before { visit nyc_path }

		it { should have_content('NYC') }
		it { should have_title(full_title('NYC')) }
	end

	describe "Ohio page" do
		before { visit ohio_path }

		it { should have_content('Ohio') }
		it { should have_title(full_title('Ohio')) }
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		expect(page).to have_title(full_title('About'))
		click_link "Contact"
		expect(page).to have_title(full_title('Contact'))
		click_link "BADPHOTO"
		expect(page).to have_title(full_title(''))
		click_link "LA"
		expect(page).to have_title(full_title('LA'))
		click_link "Model Tests"
		expect(page).to have_title(full_title('Model Tests'))
		click_link "Ohio"
		expect(page).to have_title(full_title('Ohio'))
		click_link "NYC"
		expect(page).to have_title(full_title('NYC'))
	end
end