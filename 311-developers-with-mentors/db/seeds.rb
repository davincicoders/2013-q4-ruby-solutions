Developer.create! id: 1, name: "Ted"
Developer.create! id: 2, name: "Ursula"
Developer.create! id: 3, name: "Rita"
Developer.create! id: 4, name: "Dan"
Developer.create! id: 5, name: "Paula"
Developer.create! id: 6, name: "Phil"

Developer.find(2).mentee_ids = [3, 4]
Developer.find(1).mentee_ids = [3]
Developer.find(5).mentee_ids = [6]
Developer.find(6).mentee_ids = [5]
