//
//  FactTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

//Next we'll finish the implementation of FactTableViewController, the table view controller that manages the detailed planet view. Open up FactTableViewController.swift in Xcode's code editor to get started on this class.
//First, add a constant String called factCellIdentifier. This is the reuse identifier for the cells managed by this table view controller, so it will be used to dequeue a reusable cell for this table. Assign to this variable the string "FactCell".
//Create a property planet of type Planet!. This will store the planet whose facts are displayed in this table.
//Override viewDidLoad() to change the title of the table view to the name of the planet stored in the planet property. This title will be displayed in the nav bar. Don't forget to call super.viewDidLoad(), too!
//Override numberOfSections(in:) to return the number of sections in this table view (just one).
//Override tableView(_:numberOfRowsInSection:) to return the number of rows in the table. This is equal to the number of facts you have for the planet being displayed in this view. Remember, the planet is stored in the planet property, and Planets have a facts array that stores all their facts.
//We'll save the implementation of the final table view controller method, tableView(_:cellForRowAt:) for later, after we've completed the implementation of FactTableViewCell, which requires some work in Interface Builder.

class FactTableViewController: UITableViewController {
    let factCellIdentifier: String = "FactCell"
    var planet: Planet!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = planet.name
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planet.facts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: factCellIdentifier, for: indexPath) as! FactTableViewCell
        cell.factTextView.text = planet.facts[indexPath.row]
        return cell
    }
}
