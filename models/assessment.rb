class Assessment
  include DataMapper::Resource

  property :id, Serial
  property :rating, Integer

  belongs_to :image
end