# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Information.destroy_all
User.destroy_all
Question.destroy_all
Quizz.destroy_all
=begin
5.times do
    User.create({
        username: Faker::Name.name,
        password: Faker::Crypto.md5
    })
end
=end


    Quizz.create({
        title: "La mythologie grecque",
    })



    Question.create({
        question: "Dans le récit d'Homère, quel héros grec a pu, sans se faire dévorer, entendre le chant de ces êtres mi-femmes, mi-poissons : les sirènes ?",
        response1: "Orphée",
        response2: "Ulysse",
        response3: "Jason",
        response4: "Achille",
        answer: 2,
        quizz_id: 1,
    })

    Question.create({
        question: "Pour quel personnage important de la mythologie grecque Amalthée, la chèvre, a-t-elle donné son lait l'élever ?",
        response1: "Zeus",
        response2: "Apollon",
        response3: "Héraclès",
        response4: "Persée",
        answer: 1 ,
        quizz_id: 1,
    })


    Question.create({
        question: "Quel créature ne fait pas partie de la mythologie grecque ?",
        response1: "Cyclope",
        response2: "Harpie",
        response3: "Walkyrie",
        response4: "Nymphe",
        answer: 3,
        quizz_id: 1,
    })

    Question.create({
        question: "La Chimère est un lion crachant du feu avec une tête de chèvre sur le dos et une queue de serpent. Elle semait la terreur en Lycie avant qu'un héros ne réussisse à la tuer. Quel est son nom ?
",
        response1: "Bellérophon",
        response2: "Hercule",
        response3: "Énée",
        response4: "Œdipe",
        answer: 1 ,
        quizz_id: 1,
    })
