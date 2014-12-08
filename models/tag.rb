class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :image, :through => Resource
end