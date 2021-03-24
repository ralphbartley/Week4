def set_up_test_table
  visit '/'
  click_on 'view_bookmarks'
  fill_in 'title', with: 'New Bookmark'
  fill_in 'url', with: 'http://www.newbookmark.com'
  click_on 'Add Bookmark'
  fill_in 'title', with: 'Second Bookmark'
  fill_in 'url', with: 'http://www.Secondbookmark.com'
  click_on 'Add Bookmark'
end
