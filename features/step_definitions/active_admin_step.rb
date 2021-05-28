Given(/^a user logs in to active admin$/) do
  @active_admin_page = ActiveAdminLoginPage.new(@browser)
  @active_admin_page.visit_active_admin_site
  @active_admin_page.enter_email("admin@example.com")
  @active_admin_page.enter_password("password")
  @active_admin_page.click_login_button
end

When(/a user visits the "([^"]*)" index$/) do |keyword|
  @active_admin_page.visit_active_admin_index(keyword)
end

Then(/^user should see the articles title$/) do
  expect(@active_admin_page.title_bar_present?).to eql(true)
  expect(@active_admin_page.title_bar).to include("Articles")
end

Then(/^user should see the articles table$/) do
  expect(@active_admin_page.articles_table_present?).to eql(true)
  expect(@active_admin_page.articles_table.match?('cooking')).to eql(true)
end
