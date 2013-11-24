Place.create! id: 1, name: "On the beach"
Place.create! id: 2, name: "In the ocean"
Place.create! id: 3, name: "In a cave"

Trail.create! from_place_id: 1, direction: "west", to_place_id: 2
Trail.create! from_place_id: 2, direction: "east", to_place_id: 1
Trail.create! from_place_id: 1, direction: "east", to_place_id: 3
