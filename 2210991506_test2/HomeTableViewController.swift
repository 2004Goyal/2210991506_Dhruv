//
//  HomeTableViewController.swift
//  2210991506_test2
//
//  Created by Dhruv Goyal on 23/11/24.
//

import UIKit

class HomeTableViewController: UITableViewController {

        
        var meals: [Meal] = [
            Meal(name: "Oatmeal", calories: 150, preparationTime: 10, image: UIImage(named: "oatmeal")),
            Meal(name: "Grilled Paneer", calories: 320, preparationTime: 20, image: UIImage(named: "paneer")),
            Meal(name: "Salad", calories: 120, preparationTime: 15, image: UIImage(named: "salad"))
        ]

        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Meal Planner"
        }

      
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return meals.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealTableViewCell
            let meal = meals[indexPath.row]
            cell.recipeNameLabel.text = meal.name
            cell.calorieLabel.text = "Calories: \(meal.calories)"
            cell.preparationTimeLabel.text = "Time: \(meal.preparationTime) mins"
            cell.recipeImageView.image = meal.image
            return cell
        }

        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "toMealDetails", sender: meals[indexPath.row])
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toMealDetails" {
                let destination = segue.destination as! MealDetailsViewController
                destination.meal = sender as? Meal
            }
        }
    }

