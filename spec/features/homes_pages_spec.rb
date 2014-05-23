require 'spec_helper'

describe 'Homes Pages' do
  describe '#show' do
    before { visit root_path }
    it "has the title 'Tic Tac Toe'" do
      expect(page).to have_title('Tic Tac Toe')
    end

    it 'displays nine buttons with dashes' do
      expect(page).to have_selector("input[type=submit][value='-']", count: 9)
    end
  end
end