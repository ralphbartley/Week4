require 'bookmark'

describe Bookmark do


  describe '#self.all' do
    it 'lists all stored bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")

      expect(Bookmark.all).to include("http://www.makersacademy.com")
    end
  end

end
