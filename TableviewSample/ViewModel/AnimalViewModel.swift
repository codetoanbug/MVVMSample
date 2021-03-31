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
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return animals.count
    }

    func cellForRowAt(indexPath: IndexPath) -> Animal {
        return animals[indexPath.row]
    }
}
