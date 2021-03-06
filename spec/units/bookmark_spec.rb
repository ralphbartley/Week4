require 'bookmark'

describe Bookmark do

  describe '#self.all' do
    it 'lists all stored bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Makers Academy', 'http://www.makersacademy.com');")
      bookmark = Bookmark.all.first
      expect(bookmark.id.to_i).to be_an(Integer)
      expect(bookmark.title).to eq('Makers Academy')
      expect(bookmark.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '#self.add' do
    it 'creates a Bookmark object with database data' do
      Bookmark.add("Makers Academy", "http://www.makersacademy.com")
      bookmark = Bookmark.all.first
      expect(bookmark.id.to_i).to be_an(Integer)
      expect(bookmark.title).to eq('Makers Academy')
      expect(bookmark.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '#self.delete' do
    it 'deletes the bookmark from the database' do
      Bookmark.add("Makers Academy", "http://www.makersacademy.com")
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec("SELECT id FROM bookmarks WHERE title='Makers Academy';")
      id = result.first['id']
      Bookmark.delete(id)
      expect(Bookmark.all).to eq []
    end
  end
end
