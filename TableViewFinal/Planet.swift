//
//  Planet.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

//The data for this app will be stored in instances of a simple class called Planet, which is implemented in Planet.swift. This class has no behavior other than storing the attributes of a planet. It will be used by the table view controller to store data about planets. Completing this class is easy:
//Add four properties to the Planet class: name, numberOfMoons, fullOrbit, and facts. name should obviously be a String, and numberOfMoons should be an Int.
//fullOrbit is the length of the planet's orbits in days. Can you guess what data type this should be? A planet's orbit can be a fraction of an Earth day, so this should be a Double.
//Each fact is a String, and a planet can have a number of facts, so this should be an Array of Strings ([String]).
//Implement an initializer (an init method) that accepts these four properties as parameters and sets the properties to the relevant parameter.

class Planet {
    var name: String
    var numberOfMoons: Int
    var fullOrbit: Double
    var facts: [String]
    init(name: String, numberOfMoons: Int, fullOrbit: Double, facts: [String]) {
        self.name = name
        self.numberOfMoons = numberOfMoons
        self.fullOrbit = fullOrbit
        self.facts = facts
    }
}
