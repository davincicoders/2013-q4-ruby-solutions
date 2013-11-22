CellPhone.create! id: 1, serial_number: "12345"
CellPhone.create! id: 2, serial_number: "23456"
CellPhone.create! id: 3, serial_number: "34567"

Person.create! name: "Jill", cell_phone_id: 1
Person.create! name: "Jack", cell_phone_id: 2
Person.create! name: "Bob",  cell_phone_id: nil

