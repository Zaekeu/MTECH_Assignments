//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Zach on 11/15/22.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        let breakfast = Meal(name: "Breakfast", food: [Food(name: "Pancakes", description: "Cakes with Butter and Syrup"), Food(name: "OJ", description: "Juice from oranges"), Food(name: "Fruit", description: "Big Red Apple")])
        let lunch = Meal(name: "Lunch", food: [Food(name: "Sandwhich", description: "Turkey Meat with Mayo and Lettuce"), Food(name: "Chips", description: "Doritos"), Food(name: "Soda", description: "Ice Cold MTN Dew")])
        let dinner = Meal(name: "Dinner", food: [Food(name: "Meat", description: "Big ol Roast"), Food(name: "Potatoes", description: "Big Scoop of Mashed Potatoes"), Food(name: "Cake", description: "Chocolate Cake with Chocolate Icing")])
        return [breakfast, lunch, dinner]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let food = meals[indexPath.section].food[indexPath.row]
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
