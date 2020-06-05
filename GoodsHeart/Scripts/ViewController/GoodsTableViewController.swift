//
//  GoodsTableViewController.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/06/03.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import UIKit

class GoodsTableViewController: UITableViewController {

    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoodsCell", for: indexPath) as! GoodsTableViewCell
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        }
    }

    @IBAction func sortTableItems(_ sender: UIBarButtonItem) {
        
        let actionBar = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionBar.addAction(UIAlertAction(title: "이름순", style: .default, handler: {
            result in
        }))
        actionBar.addAction(UIAlertAction(title: "가격순", style: .default, handler: {
                      result in
        }))
        actionBar.addAction(UIAlertAction(title: "태그순", style: .default, handler: {
                      result in
        }))
        actionBar.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        
        self.present(actionBar, animated: true, completion: nil)
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
