//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Hayden Hastings on 5/23/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    let friendsModel = FriendsModel()
    let navigationControllerDelegate = NavigationControllerDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friendsModel.friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath)
        
        guard let imageCell = cell as? FriendsTableViewCell else { return cell }
        
        let image = friendsModel.friends[indexPath.row]
        
        imageCell.friends = image

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            navigationControllerDelegate.sourceCell = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell
        }
    }
    

}
