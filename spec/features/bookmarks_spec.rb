feature 'bookmarks' do

  scenario 'shows bookmarks from the list' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers', 'http://www.makersacademy.com');")


    visit '/'
    click_on 'view_bookmarks'
    expect(page).to have_link('Makers', :href => "http://www.makersacademy.com")
  end
end

feature 'add bookmark' do

  scenario 'add a bookmark to the list' do
    visit '/'
    click_on 'view_bookmarks'
    fill_in 'title', with: 'New Bookmark'
    fill_in 'url', with: 'http://www.newbookmark.com'
    click_on 'Add Bookmark'
    expect(page).to have_link('New Bookmark', :href => "http://www.newbookmark.com")
  end

end

feature 'delete bookmark' do
  scenario 'deletes a bookmark from the list' do
    set_up_test_table
    fill_in 'title', with: 'New Bookmark'
    click_on 'Delete Bookmark'
    expect(page).to_not have_link('New Bookmark', :href => "http://www.newbookmark.com")
    expect(page).to have_link('Second Bookmark', :href => "http://www.Secondbookmark.com")
  end
end
