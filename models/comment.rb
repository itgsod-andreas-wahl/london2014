class Comment
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :owner, String

  belongs_to :image
end