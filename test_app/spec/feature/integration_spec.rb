# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowlins'
    fill_in 'Price', with: '20.0'
    fill_in 'book[published_date]', with: '1999-12-13'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'without a title' do
    visit new_book_path
    fill_in 'Author', with: 'JK Rowlins'
    fill_in 'Price', with: '20.0'
    fill_in 'book[published_date]', with: '1999-12-13'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('harry potter')
  end

  scenario 'without a author' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Price', with: '20.0'
    fill_in 'book[published_date]', with: '1999-12-13'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('harry potter')
  end

  scenario 'without a price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowlins'
    fill_in 'book[published_date]', with: '1999-12-13'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('harry potter')
  end

  scenario 'without a published date' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowlins'
    fill_in 'Price', with: '20.0'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('harry potter')
  end

  scenario 'alphanumeric price error' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowlins'
    fill_in 'Price', with: '123.abc'
    fill_in 'book[published_date]', with: '1999-12-13'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('harry potter')
  end

  scenario 'only letters price error' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowlins'
    fill_in 'Price', with: 'abc'
    fill_in 'book[published_date]', with: '1999-12-13'
    click_on 'Create Book'
    visit books_path
    expect(page).to_not have_content('harry potter')
  end
end