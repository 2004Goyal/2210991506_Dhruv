//
//  MealDetailsViewController.swift
//  2210991506_test2
//
//  Created by Dhruv Goyal on 23/11/24.
//

import UIKit

class MealDetailsViewController: UIViewController {

        var meal: Meal?

        @IBOutlet weak var mealImageView: UIImageView!
        @IBOutlet weak var mealNameLabel: UILabel!
        @IBOutlet weak var calorieLabel: UILabel!
        @IBOutlet weak var preparationTimeLabel: UILabel!

        override func viewDidLoad() {
            super.viewDidLoad()

            
            if let meal = meal {
                mealNameLabel.text = meal.name
                calorieLabel.text = "Calories: \(meal.calories)"
                preparationTimeLabel.text = "Preparation Time: \(meal.preparationTime) mins"
                mealImageView.image = meal.image
            }
        }
    @IBAction func editButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "editMeal", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editMeal" {
            if let mealInputVC = segue.destination as? MealInputViewController {
                mealInputVC.meal = self.meal
            }
        }
    }

    }
