//
//  AnimalViewModel.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/03/31.
//

import Foundation

class AnimalViewModel {
    private var animals: [Animal]

    init() {
        animals = []

        // Create data source
        animals.append(Animal(name: "Alligator", image: "Alligator"))
        animals.append(Animal(name: "Anteater", image: "Anteater"))
        animals.append(Animal(name: "Armadillo", image: "Armadillo"))
        animals.append(Animal(name: "Auroch", image: "Auroch"))
        animals.append(Animal(name: "Axolotl", image: "Axolotl"))
        animals.append(Animal(name: "Badger", image: "Badger"))
        animals.append(Animal(name: "Bat", image: "Bat"))
        animals.append(Animal(name: "Beaver", image: "Beaver"))
        animals.append(Animal(name: "Buffalo", image: "Buffalo"))
        animals.append(Animal(name: "Camel", image: "Camel"))
        animals.append(Animal(name: "Capybara", image: "Capybara"))
        animals.append(Animal(name: "Chameleon", image: "Chameleon"))
        animals.append(Animal(name: "Cheetah", image: "Cheetah"))
        animals.append(Animal(name: "Chinchilla", image: "Chinchilla"))
        animals.append(Animal(name: "Chipmunk", image: "Chipmunk"))
        animals.append(Animal(name: "Chupacabra", image: "Chupacabra"))
        animals.append(Animal(name: "Cormorant", image: "Cormorant"))
        animals.append(Animal(name: "Coyote", image: "Coyote"))
        animals.append(Animal(name: "Crow", image: "Crow"))
        animals.append(Animal(name: "Dingo", image: "Dingo"))
        animals.append(Animal(name: "Dinosaur", image: "Dinosaur"))
        animals.append(Animal(name: "Dolphin", image: "Dolphin"))
        animals.append(Animal(name: "Duck", image: "Duck"))
        animals.append(Animal(name: "Elephant", image: "Elephant"))
        animals.append(Animal(name: "Ferret", image: "Ferret"))
        animals.append(Animal(name: "Fox", image: "Fox"))
        animals.append(Animal(name: "Frog", image: "Frog"))
        animals.append(Animal(name: "Giraffe", image: "Giraffe"))
        animals.append(Animal(name: "Gopher", image: "Gopher"))
        animals.append(Animal(name: "Grizzly", image: "Grizzly"))
        animals.append(Animal(name: "Hedgehog", image: "Hedgehog"))
        animals.append(Animal(name: "Hippo", image: "Hippo"))
        animals.append(Animal(name: "Hyena", image: "Hyena"))
        animals.append(Animal(name: "Ibex", image: "Ibex"))
        animals.append(Animal(name: "Ifrit", image: "Ifrit"))
        animals.append(Animal(name: "Iguana", image: "Iguana"))
        animals.append(Animal(name: "Jackal", image: "Jackal"))
        animals.append(Animal(name: "Kangaroo", image: "Kangaroo"))
        animals.append(Animal(name: "Koala", image: "Koala"))
        animals.append(Animal(name: "Kraken", image: "Kraken"))
        animals.append(Animal(name: "Lemur", image: "Lemur"))
        animals.append(Animal(name: "Leopard", image: "Leopard"))
        animals.append(Animal(name: "Liger", image: "Liger"))
        animals.append(Animal(name: "Llama", image: "Llama"))
        animals.append(Animal(name: "Manatee", image: "Manatee"))
        animals.append(Animal(name: "Mink", image: "Mink"))
        animals.append(Animal(name: "Monkey", image: "Monkey"))
        animals.append(Animal(name: "Moose", image: "Moose"))
        animals.append(Animal(name: "Narwhal", image: "Narwhal"))
        animals.append(Animal(name: "Nyan Cat", image: "Nyan Cat"))
        animals.append(Animal(name: "Orangutan", image: "Orangutan"))
        animals.append(Animal(name: "Otter", image: "Otter"))
        animals.append(Animal(name: "Panda", image: "Panda"))
        animals.append(Animal(name: "Penguin", image: "Penguin"))
        animals.append(Animal(name: "Platypus", image: "Platypus"))
        animals.append(Animal(name: "Pumpkin", image: "Pumpkin"))
        animals.append(Animal(name: "Python", image: "Python"))
        animals.append(Animal(name: "Quagga", image: "Quagga"))
        animals.append(Animal(name: "Rabbit", image: "Rabbit"))
        animals.append(Animal(name: "Raccoon", image: "Raccoon"))
        animals.append(Animal(name: "Rhino", image: "Rhino"))
        animals.append(Animal(name: "Sheep", image: "Sheep"))
        animals.append(Animal(name: "Shrew", image: "Shrew"))
        animals.append(Animal(name: "Skunk", image: "Skunk"))
        animals.append(Animal(name: "Squirrel", image: "Squirrel"))
        animals.append(Animal(name: "Tiger", image: "Tiger"))
        animals.append(Animal(name: "Turtle", image: "Turtle"))
        animals.append(Animal(name: "Walrus", image: "Walrus"))
        animals.append(Animal(name: "Wolf", image: "Wolf"))
        animals.append(Animal(name: "Wolverine", image: "Wolverine"))
        animals.append(Animal(name: "Wombat", image: "Wombat"))
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return animals.count
    }

    func cellForRowAt(indexPath: IndexPath) -> Animal {
        return animals[indexPath.row]
    }
}
