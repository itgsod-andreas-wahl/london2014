class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  belongs_to :image
end