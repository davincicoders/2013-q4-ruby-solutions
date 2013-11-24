Photo.create! id: 1, title: "Flatirons at dawn"
Photo.create! id: 2, title: "Flatirons at sunset"
Photo.create! id: 3, title: "Sunset from my window"
Photo.create! id: 4, title: "Mysterious blur"

Tag.create! id: 1, name: "Flatirons"
Tag.create! id: 2, name: "dawn"
Tag.create! id: 3, name: "sunset"
Tag.create! id: 4, name: "Pluto"

Photo.find(1).tag_ids = [1, 2]
Photo.find(2).tag_ids = [1, 3]
Photo.find(3).tag_ids = [3]
