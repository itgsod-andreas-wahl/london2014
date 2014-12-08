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
        {id: 3, filename: '3.JPG'},
        {id: 4, filename: '4.JPG'},
        {id: 5, filename: '5.JPG'},
        {id: 6, filename: '6.JPG'},
        {id: 7, filename: '7.JPG'},
        {id: 8, filename: '8.JPG'},
        {id: 9, filename: '9.JPG'},
        {id: 10, filename: '10.JPG'}
    ]
    images = images.map {|image| Image.create(image)}
  end


  def self.tags
    tags = [
        {name: 'London', image_id: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]},
        {name: 'Rooster', image_id: 1},
        {name: 'Blue', image_id: 1},
        {name: 'Eye', image_id: 2},
        {name: 'Wheel', image_id: 2},
        {name: 'Interstellar', image_id: [3, 10]},
        {name: 'IMAX', image_id: [3, 10]},
        {name: 'Hotel', image_id: 4},
        {name: 'Smoke', image_id: 4},
        {name: 'British museum', image_id: [5, 6, 7, 8]},
        {name: 'Farao', image_id: 6},
        {name: 'Egypt', image_id: [6, 7, 8]},
        {name: 'Goat', image_id: 7},
        {name: 'Statue', image_id: 8},
        {name: 'Easter', image_id: 8},
        {name: 'Big Ben', image_id: 9},
        {name: 'Spaceship', image_id: 10}
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
        {content: 'Fin bild!', image_id: 1, owner: "Andreas"},
        {content: 'Ful bild!', image_id: 3, owner: "Fredrik"}
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