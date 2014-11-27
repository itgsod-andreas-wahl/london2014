class Comment
  include DataMapper::Resource

  property :id, Serial
  property :content, String

  belongs_to :image
end