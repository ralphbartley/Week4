feature 'user arrives at home page' do
  scenario 'it should welcome the user' do  
    visit '/'
    expect(page).to have_content("Welcome to the Bookmark Manager!")
  end
end
