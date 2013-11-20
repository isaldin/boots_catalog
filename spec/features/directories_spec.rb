#encoding: utf-8

require 'spec_helper'

describe 'Directories', :type => :feature do

  before :each do
    Colour.destroy_all
  end

  it 'must show list of items' do
    Colour.create!(:name => 'Red')
    Colour.create!(:name => 'Green')
    Colour.create!(:name => 'Blue')

    visit '/colours'

    page.should have_content('Name')
    page.should have_content('Red')
    page.should have_content('Green')
    page.should have_content('Blue')
  end

  it 'must add item' do
    visit '/colours'
    click_link('New')
    fill_in('Name', :with => 'Red')
    click_button('Create')
    page.should have_content('Red')
  end

  it 'must edit item' do
    Colour.create!(:name => 'Red')

    visit '/colours'
    click_link('[edit]')

    fill_in('Name', :with => 'Green')
    click_button('Save')

    page.should have_no_content('Red')

    page.should have_content('Successfully updated')
    page.should have_content('Green')
  end

  it 'must delete item' do
    Colour.create!(:name => 'Red')

    visit '/colours'

    page.should have_content('Red')

    click_link('[delete]')

    page.should have_no_content('Red')

    page.should have_content('Successfully deleted')
  end

  it 'must has validation' do
    visit '/colours'

    click_link('New')

    click_button('Create')

    page.should have_content('Name can\'t be blank')
    assert_equal(0, Colour.count)
  end

end
