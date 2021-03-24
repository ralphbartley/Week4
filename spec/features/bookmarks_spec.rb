feature 'bookmarks' do

  scenario 'shows bookmarks from the list' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")


    visit '/'
    click_on 'view_bookmarks'
    expect(page).to have_content("http://www.makersacademy.com")
  end

end
