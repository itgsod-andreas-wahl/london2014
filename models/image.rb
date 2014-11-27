class Image
  include DataMapper::Resource

  property :id, Serial
  property :filename, String

  has n, :assessments
  has n, :comments
  has n, :tags
end