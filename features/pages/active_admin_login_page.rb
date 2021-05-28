require 'pry-byebug'

class ActiveAdminLoginPage
  include PageObject

  text_field(:email_box, id: "admin_user_email")
  text_field(:password_box, id: "admin_user_password")
  button(:login, value: "Login")
  div(:title_bar, id: "title_bar")
  table(:articles_table, id: "index_table_articles")

  def login_admin
    @browser.navigate.to 'http://127.0.0.1:3000/admin'
    self.email_box = 'admin@example.com'
    self.password_box = 'password'
    login
  end

  def visit_active_admin_site
    @browser.navigate.to 'http://127.0.0.1:3000/admin'
  end

  def visit_active_admin_index(index)
    @browser.navigate.to "http://127.0.0.1:3000/admin/#{index}"
  end

  def enter_email(email)
    self.email_box = email
  end

  def enter_password(password)
    self.password_box = password
  end

  def click_login_button
    login
  end

  def title_bar_present?
    self.title_bar.present?
  end

  def articles_table_present?
    self.articles_table.present?
  end

  def close
    @browser.close
  end
end
