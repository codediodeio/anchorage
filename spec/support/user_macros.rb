include Warden::Test::Helpers

module UserMacros
  def login(user)
    visit root_path
    click_link "Login"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
  end

  def quick_login(user)
    # sign_in user, :event => :authentication
    login_as user, scope: :user
    user
  end

end
