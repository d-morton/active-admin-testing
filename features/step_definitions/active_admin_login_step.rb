Given(/^a user goes to active admin page$/) do
  @active_admin_page = ActiveAdminLoginPage.new(@browser)
  @active_admin_page.visit_active_admin_site
end

When(/^a user clicks on login$/) do
  @active_admin_page.click_login_button
end

When(/a user enters their email "([^"]*)"$/) do |keyword|
  @active_admin_page.email_box_element.wait_until(&:present?)
  @active_admin_page.enter_email(keyword)
end

When(/a user enters their password "([^"]*)"$/) do |keyword|
  @active_admin_page.password_box_element.wait_until(&:present?)
  @active_admin_page.enter_password(keyword)
end

Then(/^user should log in$/) do
  expect(@active_admin_page.title_bar_present?).to eql(true)
  @active_admin_page.close
end
