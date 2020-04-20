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

Quizz.create({
  title: "La géographie européenne",

  })
    Question.create({
      question: "Combien y a-t-il d'habitants, à 500 000 près, en Moldavie ?",
      response1: "3 000 000 habitants",
      response2: "3 500 000 habitants",
      response3: "4 000 000 habitants",
      response4: "4 500 000 habitants",
      answer: 2 ,
      quizz_id: 2,
      })


    Question.create({
      question: "Combien y a-t-il d'habitants, à 1 500 000 près, en Finlande ?",
      response1: "4 000 000 habitants",
      response2: "5 500 000 habitants",
      response3: "7 000 000 habitants",
      response4: "8 500 000 habitants",
      answer: 2,
      quizz_id: 2,
    })


    Question.create({
      question: "Quelle est la principale religion en Hongrie ?",
      response1: "Le christianisme",
      response2: "Le judaïsme",
      response3: "Le folklorique",
      response4: "L'islam ",
      answer: 1,
      quizz_id: 2,
    })

    Question.create({
      question: "Quelle est la capitale des Pays-Bas ?",
      response1: "Amsterdam",
      response2: "Chișinău ",
      response3: "Cité du Vatican ",
      response4: "Rouen ",
      answer: 1 ,
      quizz_id: 2,
    })

    Question.create({
      question: "Quelle est le pays ayant un drapeau rouge, de forme carrée avec une croix blanche au centre ?",
      response1: "Amhara",
      response2: "la Biélorussie",
      response3: "la Suisse",
      response4: "Vatican",
      answer: 3,
      quizz_id: 2,
    })


Quizz.create({
  title: "Culture Génerale - Difficile",

  })

  Question.create({
    question: "Quel est le synonyme de ''avant-avant-dernier'' ?",
    response1: "Pénultième",
    response2: "Antépénultième",
    response3: "Préantépénultième",
    response4: "Premier",
    answer: 2,
    quizz_id: 3,
  })

  Question.create({
    question: "De quel signe astrologique est une personne née le 1er avril ?",
    response1: "Capricorne",
    response2: "Bélier",
    response3: "Taureau",
    response4: "Vierge",
    answer: 2,
    quizz_id: 3,
  })

  Question.create({
    question: "Quelle est la plus petite planète du Système solaire ?",
    response1: "Mercure",
    response2: "Vénus",
    response3: "Neptune",
    response4: "La Terre",
    answer: 1,
    quizz_id: 3,
  })

  Question.create({
    question: "Lequel de ces romans est une œuvre de Léon Tolstoï ?",
    response1: "Anna Karénine",
    response2: "Le Joueur",
    response3: "L'idiot",
    response4: "L'illetré",
    answer: 1,
    quizz_id: 3,
  })


  Question.create({
    question: "Dans la mythologie romaine, qui est le dieu de la vigne et du vin ?",
    response1: "Dionysos",
    response2: "Plutus",
    response3: "Bacchus",
    response4: "Poseïdon",
    answer: 3,
    quizz_id: 3,
  })

  Question.create({
    question: "Pendant la Seconde Guerre mondiale, dans quel pays Anne Frank est-elle restée cachée, confinée ?",
    response1: "En Belgique",
    response2: "Aux Pays-Bas",
    response3: "Au Luxembourg",
    response4: "En Allemagne",
    answer: 2,
    quizz_id: 3,
  })
