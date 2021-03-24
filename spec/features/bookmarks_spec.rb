feature 'bookmarks' do

  scenario 'shows bookmarks from the list' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")


    visit '/'
    click_on 'view_bookmarks'
    expect(page).to have_content("http://www.makersacademy.com")
  end
end

feature 'add bookmark' do

  scenario 'add a bookmark to the list' do
    visit '/'
    click_on 'view_bookmarks'
    fill_in 'url', with: 'http://www.newbookmark.com'
    click_on 'add_bookmark'
    expect(page).to have_content("http://www.newbookmark.com")
  end

end
