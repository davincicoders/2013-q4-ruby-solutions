Company.create! id: 1, name: "Microsoft"
Company.create! id: 2, name: "IBM"
Company.create! id: 3, name: "Sun"

Person.create! name: "John",   company_id: 1
Person.create! name: "Jill",   company_id: 2
Person.create! name: "Jack",   company_id: 2
Person.create! name: "Ursula", company_id: nil
