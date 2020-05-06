//
//  MealTableViewController.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/04/20.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    var meals = [Meal]()
    
    private func loadSampleMeals() {
        let photo1 = UIImage(named: "chicken")
        let photo2 = UIImage(named: "pizza")
        let photo3 = UIImage(named: "pork")
        
        guard let meal1 = Meal(name: "Chicken", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
         
        guard let meal2 = Meal(name: "Pizza", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
         
        guard let meal3 = Meal(name: "Grilld Pork", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal2")
        }
        
        meals += [meal1, meal2, meal3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

loadSampleMeals()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
     guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell  else {
     fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating

        return cell
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}
