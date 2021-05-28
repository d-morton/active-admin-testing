require 'rails_helper'
require 'webdrivers/chromedriver'
require 'page-object'
require_relative '../features/pages/active_admin_login_page'

RSpec.describe 'Articles Index' do
  subject do
    @active_admin_page = ActiveAdminLoginPage.new(@browser)
    @active_admin_page.login_admin
  end

  before do
    @browser = Selenium::WebDriver.for :chrome
    @browser.manage.window.minimize
  end


  it 'has expected page contents' do
    subject
    expect(@active_admin_page.title_bar_element.present?).to be true
    expect(@active_admin_page.link_elements.count).to eq 7
    @browser.close
  end
end
