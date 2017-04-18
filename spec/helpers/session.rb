module SessionHelpers

  def sign_up(email: 'me@mecom', password: '12345678', password_confirmation: '12345678')
    visit('/users/new')
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    fill_in(:password_confirmation, with: password_confirmation)
    fill_in(:name, with: 'Mario')
    fill_in(:surname, with: 'Super')
    click_button('Sign Up')
  end


end
