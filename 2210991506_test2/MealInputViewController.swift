//
//  MealInputViewController.swift
//  2210991506_test2
//
//  Created by Dhruv Goyal on 23/11/24.
//

import UIKit

class MealInputViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    @IBOutlet weak var nutritionalInfoTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!

    var ingredients: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        ingredientsTableView.dataSource = self
        ingredientsTableView.delegate = self
    }

    
    func setupUI() {
        instructionsTextView.layer.borderColor = UIColor.gray.cgColor
        instructionsTextView.layer.borderWidth = 1.0
        instructionsTextView.layer.cornerRadius = 5.0
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath)
        cell.textLabel?.text = ingredients[indexPath.row]
        return cell
    }

    
    @IBAction func addIngredientButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add Ingredient", message: "Enter ingredient and quantity", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Ingredient"
        }
        alert.addTextField { textField in
            textField.placeholder = "Quantity"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let ingredient = alert.textFields?[0].text, !ingredient.isEmpty,
               let quantity = alert.textFields?[1].text, !quantity.isEmpty {
                self.ingredients.append("\(ingredient): \(quantity)")
                self.ingredientsTableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let recipeName = recipeNameTextField.text, !recipeName.isEmpty,
              let instructions = instructionsTextView.text, !instructions.isEmpty,
              let nutritionalInfo = nutritionalInfoTextField.text, !nutritionalInfo.isEmpty else {
            showErrorAlert()
            return
        }

        let categoryIndex = categorySegmentedControl.selectedSegmentIndex
        let category = categoryIndex == 0 ? "Vegetarian" : "Gluten-Free"

        print("Recipe Name: \(recipeName)")
        print("Ingredients: \(ingredients)")
        print("Instructions: \(instructions)")
        print("Category: \(category)")
        print("Nutritional Info: \(nutritionalInfo)")
    }

   
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Please fill in all fields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

