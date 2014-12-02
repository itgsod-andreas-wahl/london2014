class Seed
  def self.seed
    self.images
    self.tags
    self.comments
    self.assessments
  end


  def self.images
    images = [
        {id: 1, filename: '1.JPG'},
        {id: 2, filename: '2.JPG'},
        {id: 3, filename: '3.JPG'}
    ]
    images = images.map {|image| Image.create(image)}
  end


  def self.tags
    tags = [
        {name: 'London', image_id: [1, 2, 3]},
        {name: 'Rooster', image_id: 1},
        {name: 'blue', image_id: 1},
        {name: 'eye', image_id: 2},
        {name: 'wheel', image_id: 2},
        {name: 'Interstellar', image_id: 3},
        {name: 'IMAX', image_id: 3}
    ]

    tags_objects = tags.map {|tag| Tag.create(name: tag[:name])}

    tags.each_with_index do |data, i|
      if data[:image_id].is_a? Array
        data[:image_id].each do |id|
          img = Image.get(id)
          img.tags << tags_objects[i]
          img.save
        end
      else
        img = Image.get(data[:image_id])
        img.tags << tags_objects[i]
        img.save
      end
    end
  end


  def self.comments
    comments = [
        {content: 'Fin bild!', image_id: 1},
        {content: 'Ful bild!', image_id: 3}
    ]

    comments.each {|comment| Comment.create(comment)}
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