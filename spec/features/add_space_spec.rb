feature "adding spaces" do

  before do
    sign_up
    list_space
  end

  scenario "user can access new space form from home page" do
    page.find(:xpath, "//a[@href='/spaces/new']").click
    expect(current_path).to eq('/spaces/new')
  end

  scenario "user can list space" do
    expect{ list_space }.to change(Space, :count).by(1)
  end

  scenario "user can add name" do
    expect(page).to have_content("JJ's sexy pad")
  end

  scenario "user can add description" do
    expect(page).to have_content("JJ's sexy pad is nice!")
  end

  scenario "user can add price per night" do
    expect(page).to have_content(5000)
  end

  scenario "user can add available dates" do
    expect(page).to have_content("2001-04-30")
    expect(page).to have_content("2001-05-30")
  end

  scenario "host name displayed with each space" do
    expect(page).to have_content('Host: Mario Super')
  end

  scenario "Only signed in users can add a new space" do
    click_button('Sign Out')
    visit '/spaces/new'
    expect(page).not_to have_content('list space')
    expect(page).to have_content('Please sign in first in order to add a new place to FourM.')
  end

end
