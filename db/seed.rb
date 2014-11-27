class Seed
  def self.seed
    self.tags
    self.images
    self.comments
    self.assessments
  end


  def self.images
    categories = [
        {id: 1, filename: '1.JPG'},
        {id: 2, filename: '2.JPG'},
        {id: 3, filename: '3.JPG'}
    ]

    categories.each do |image|
      Image.create(image)
    end
  end


  def self.tags
    tags = [
        {name: 'London', image_id: 1},
        {name: 'Rooster', image_id: 1},
        {name: 'blue', image_id: 1},
        {name: 'London', image_id: 2},
        {name: 'eye', image_id: 2},
        {name: 'wheel', image_id: 2},
        {name: 'London', image_id: 3},
        {name: 'Interstellar', image_id: 3},
        {name: 'IMAX', image_id: 3}
    ]
    tags.each do |tag|
      Tag.create(tag)
    end
  end


  def self.comments
    comments = [
        {content: 'fin bild', image_id: 1},
        {content: 'ful bild', image_id: 3}

    ]
    comments.each do |comment|
      Comment.create(comment)
    end
  end


  def self.assessments
    assessments = [
        {rating: 5, image_id: 1},
        {rating: 0, image_id: 1},
        {rating: 4, image_id: 2},
        {rating: 2, image_id: 2},
        {rating: 1, image_id: 3},
        {rating: 3, image_id: 3}

    ]
    assessments.each do |assessment|
      Assessment.create(assessment)
    end

  end

end