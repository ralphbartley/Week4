require 'bookmark'

describe Bookmark do


  describe '#self.all' do
    it 'lists all stored bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers Academy', 'http://www.makersacademy.com');")

      expect(Bookmark.all).to include({:title => "Makers Academy", :url => "http://www.makersacademy.com"})
    end
  end

end
