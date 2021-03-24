require 'pg'
class Bookmark

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = return_database
    result = connection.exec('SELECT * FROM bookmarks')
    result.map do |row|
      Bookmark.new(row['id'], row['title'], row['url'])
    end
  end

  def self.add(title, url)
    connection = return_database
    connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}');")
  end

  private

  def self.return_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end

end
