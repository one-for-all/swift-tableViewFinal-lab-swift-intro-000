//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

//Let's implement the code for PlanetTableViewController next. This is the class that will power the main table view.
//Open up PlanetTableViewController.swift in Xcode's code editor. Right now, this class is completely empty, but adding code to make it work is pretty easy.
//Here's what you need to do to complete this class:
//Add a property called planetCellIdentifier. This is a String which will identify the type of cell you want to dequeue from the table view. Assign this the string "PlanetCell".
//You will also need to create a property called planets to store the facts for a list of planets. You already have a Planet class that will store the data, and a table view will show multiple planets, so what should the type of this property be? (If you guessed [Planet], you're right!)
//Next, you should create a method called generatePlanetInfo() that will fill in the planets property you just created. This method takes no parameters and returns no value (it sets the planets property directly). To keep this simple, you only need to generate facts for two planets, Earth and Mars. Here are the planets and their relevant facts:
//Earth
//Number of Moons: 1
//Full Orbit: 365.26
//Facts:
//Earth is the only planet not named after a god.
//Earth has a powerful magnetic field.
//Earth was once believed to be the center of the universe.
//Mars
//Number of Moons: 2
//Full Orbit: 687.0
//Facts:
//Mars and Earth have approximately the same landmass.
//Mars is home to the tallest mountain in the solar system.
//Pieces of Mars have fallen to Earth.
//You will need to call generatePlanetInfo() to fill in the planets property. You can call this from an overriden viewDidLoad() method. Don't forget to call `super.viewDidLoad() first!
//Implement numberOfSections(in:). There is only one section in this table view.
//Implement tableView(_:numberOfRowsInSection:). The number of rows is equal to the number of planets tracked by this class.
//Implement prepare(for:sender:). This method first needs to get the destination view controller using segue.destinationViewController and cast it to a view controller of type FactTableViewController. It then needs to get the index path for the selected row, and grab the correct planet from the planets property. Finally, it should set the planet property of the destination view controller to the selected planet. (If you need help, take a look at the previous labs and lessons for hints on how to implement this method properly.)
//For now, we'll skip the implementations of the remaining table view source method, tableView(_:cellForRowAt:), since that requires PlanetTableViewCell to be implemented, which, in turn, requires some work in Interface Builder. We'll come back to this method later.

class PlanetTableViewController: UITableViewController {
    var planetCellIdentifier: String = "PlanetCell"
    var planets: [Planet] = []
    func generatePlanetInfo() {
        let earthFacts = [
            "Earth is the only planet not named after a god.",
            "Earth has a powerful magnetic field.",
            "Earth was once believed to be the center of the universe."
        ]
        let marsFacts = [
            "Mars and Earth have approximately the same landmass.",
            "Mars is home to the tallest mountain in the solar system.",
            "Pieces of Mars have fallen to Earth."
        ]
        planets.append(Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: earthFacts))
        planets.append(Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687, facts: marsFacts))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as! PlanetTableViewCell
        let planet = planets[indexPath.row]
        cell.numberOfDaysFullOrbitLabel.text = "\(planet.fullOrbit)"
        cell.numberOfFacts.text = "\(planet.facts.count)"
        cell.numberOfMoonsLabel.text = "\(planet.numberOfMoons)"
        cell.planetNameLabel.text = planet.name
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? FactTableViewController else {return}
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let planet = planets[indexPath.row]
        destination.planet = planet
    }
    
}
