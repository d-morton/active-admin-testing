require 'rails_helper'

RSpec.describe 'Articles' do
  subject do
    user = AdminUser.create(email: 'test@example.com', password: 'opensesame')
    visit '/admin/login'
    fill_in 'admin_user_email', with: user.email
    fill_in 'admin_user_password', with: user.password
    click_button 'Login'

    visit admin_articles_path
  end

  describe 'index page' do
    it 'has no table' do
      subject

      expect(page).to have_text('There are no Articles yet.')
      expect(page).to have_action_item('New Article')
      expect(page).to_not have_action_item('Edit Article')
      expect(page).to_not have_table
    end

    context 'with users' do
      let!(:articles) { [Article.create!(title: 'One', body: 'all about shopping'), Article.create!(title: 'Two')] }

      it 'has correct table rows' do
        subject

        expect(page).to have_table
        within_table_for do
          expect(page).to have_table_row(count: 2)
          expect(page).to have_table_row(count: 2)
          expect(page).to have_table_cell(count: 14)
          expect(page).to have_table_cell(text: 'One', column: 'title')
        end

        within_table_row(id: articles.first.id) do
          expect(page).to have_table_cell(count: 7)
          expect(page).to have_table_cell(text: 'One')
          expect(page).to have_table_cell(text: 'all about shopping', column: 'Body')
          expect(page).to_not have_table_cell(text: 'One', column: 'Id')
        end

        within_table_row(id: articles.second.id) do
          expect(page).to have_table_cell(text: articles.second.id, column: 'Id')
          expect(page).to have_table_cell(text: 'Two', column: 'Title')
          expect(page).to_not have_table_cell(text: 'One')
        end
      end
    end
  end
end
