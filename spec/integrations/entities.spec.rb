require 'rails_helper'

RSpec.describe 'Entities', type: :feature do
  describe 'New' do
    before(:each) do
      @user = User.create!(name: 'Test User', email: 'test@gmail.com', password: '123456')
      @group = Group.create!(
        name: 'Hotels',
        icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/150px-Wikipedia-logo-v2.svg.png',
        user_id: @user.id
      )
      @entity = Entity.new(name: 'Accomodation', amount: 2, user_id: @user.id, group_ids: [@group.id])

      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit new_group_entity_path(@group)
    end

    it 'should have a name field' do
      expect(page).to have_field('entity_name')
    end

    it 'should have an amount field' do
      expect(page).to have_field('entity_amount')
    end

    it 'should have a group field' do
      expect(page).to have_field('entity_group_ids')
    end

    it 'should have a submit button' do
      expect(page).to have_button('Save')
    end

    it 'should create an entity' do
      fill_in 'entity_name', with: 'Accomodation'
      fill_in 'entity_amount', with: 2
      click_button 'Save'
      expect(page).to have_current_path(group_entities_path(@group))
    end
  end
end
