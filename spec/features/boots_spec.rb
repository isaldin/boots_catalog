#encoding: utf-8

require 'spec_helper'

describe 'Boots', :type => :feature do
  describe 'GET /boots' do
    before :each do
      Boot.destroy_all
    end

    it 'must show boots list' do
      visit '/'
      page.should have_content('Наименование')
      page.should have_content('Размер')
      page.should have_content('Цвет')
      page.should have_content('Материал подошвы')
      page.should have_content('Материал стельки')
      page.should have_content('Материал верха')
    end

    it 'must have links to directories\' CRUD'  do
      visit '/'
      page.should have_content('Каталог обуви')
      page.should have_content('Цвета')
      page.should have_content('Материалы подошвы')
      page.should have_content('Материалы стельки')
      page.should have_content('Материалы верха')
    end

    it 'must add new item' do
      Colour.create!(:name => 'Green')
      Colour.create!(:name => 'Red')
      #Sole.create!(:name => 'Rubber')
      #Insole.create!(:name => 'Cotton')
      #Surface.create!(:name => 'Canvas')

      visit '/'
      click_link('New')

      fill_in('Name', :with => 'Гриндерсы')
      fill_in('Size', :with => '45')
      select('Red', :from => 'Colour')
      #select('Rubber', :from => 'Sole')
      #select('Cotton', :from => 'Insole')
      #select('Canvas', :from => 'Surface')

      click_button('Create')

      page.should have_content('Successfully created')
      page.should have_content('Гриндерсы')
      page.should have_content('Red')
      #page.should have_content('Rubber')
      #page.should have_content('Cotton')
      #page.should have_content('Canvas')
      page.should have_content('45')

      page.should have_content('[edit]')
      page.should have_content('[delete]')
    end

    it 'must delete item' do
      Boot.create!(
          :name => 'some name',
          :size => '77',
          :colour_id => Colour.create!(:name => 'Red').id
          #:sole_id => Sole.create!(:name => 'Rubber').id,
          #:insole_id => Insole.create!(:name => 'Cotton').id,
          #:surface_id => Surface.create!(:name => 'Canvas').id,
      )

      visit '/'

      click_link('[delete]')

      page.should have_content('Successfully deleted')

      page.should have_no_content('some name')
      page.should have_no_content('77')
      page.should have_no_content('Red')
      #page.should have_no_content('Rubber')
      #page.should have_no_content('Cotton')
      #page.should have_no_content('Canvas')
    end

    it 'must correct update item' do
      Colour.create!(:name => 'Green')
      #Sole.create!(:name => 'Paper')
      #Insole.create!(:name => 'None')
      #Surface.create!(:name => 'Leather')
      Boot.create!(
          :name => 'some name',
          :size => '77',
          :colour_id => Colour.create!(:name => 'Red').id
          #:sole =>    Sole.create!(:name => 'Rubber'),
          #:insole =>  Insole.create!(:name => 'Cotton'),
          #:surface => Surface.create!(:name => 'Canvas'),
      )

      visit '/'

      click_link('edit')

      fill_in('Name', :with => 'adidas')
      fill_in('Size', :with => '42')
      select('Green', :from => 'Colour')
      #select('Paper', :from => 'Sole')
      #select('None', :from => 'Insole')
      #select('Leather', :from => 'Surface')

      click_button('Save')

      page.should have_content('Successfully updated')

      page.should have_no_content('some name')
      page.should have_no_content('77')
      page.should have_no_content('Red')
      #page.should have_no_content('Rubber')
      #page.should have_no_content('Cotton')
      #page.should have_no_content('Canvas')

      page.should have_content('adidas')
      page.should have_content('42')
      page.should have_content('Green')
      #page.should have_content('Paper')
      #page.should have_content('None')
      #page.should have_content('Leather')
    end

    it 'must has validation' do
      visit '/'

      click_link('New')

      #fill_in('Name', :with => 'adidas')
      #fill_in('Size', :with => '42')
      #select('Green', :from => 'Colour')

      click_button('Create')

      assert_equal(0, Boot.count)

      page.should have_content("Name can't be blank")
      page.should have_content("Size can't be blank")
      page.should have_content("Size is not a number")
      page.should have_content("Colour can't be blank")

    end

    #it 'create new item' do
    #  visit shoes_path
    #end
  end
end
