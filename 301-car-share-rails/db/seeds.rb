Member.create id: 1,
  username: "jen",
  password: "123",
  password_confirmation: "123"
Member.create id: 2,
  username: "ted",
  password: "456",
  password_confirmation: "456"

Car.create! color: "red",   model: "VW Golf", member_id: nil
Car.create! color: "black", model: "VW Jetta", member_id: 1
Car.create! color: "white", model: "Toyota Celica", member_id: nil
