# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(id:2, username:"Maurício")
User.create(id:3, username:"George")
User.create(id:4, username:"Edson")
User.create(id:5, username:"André")
User.create(id:6, username:"Milene")

Discipline.create(discipline_name: 'TecProg', discipline_description: 'Curso de Técnicas de Programação', discipline_year: '2015', owner_id: 2)
Discipline.create(discipline_name: 'Requisitos', discipline_description: 'Curso de Engenharia de Requisitos', discipline_year: '2015', owner_id: 3)
Discipline.create(discipline_name: 'PPC', discipline_description: 'Curso de Programação Para Competição', discipline_year: '2015', owner_id: 4)
Discipline.create(discipline_name: 'IHC', discipline_description: 'Curso de Interação Humano Computador', discipline_year: '2015', owner_id: 5)
Discipline.create(discipline_name: 'Desenho', discipline_description: 'Curso de Desenho de Software', discipline_year: '2015', owner_id: 5)

Inscription.create(user_id:2, discipline_id:2)
Inscription.create(user_id:3, discipline_id:2)
Inscription.create(user_id:4, discipline_id:2)
Inscription.create(user_id:5, discipline_id:2)
Inscription.create(user_id:6, discipline_id:2)