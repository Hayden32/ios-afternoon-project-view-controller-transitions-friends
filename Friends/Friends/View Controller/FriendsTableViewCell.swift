//
//  FriendsTableViewCell.swift
//  Friends
//
//  Created by Hayden Hastings on 5/23/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    var friends: Friends? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let friends = friends else { return }
        
        photoImageView.image = friends.image
    }
    
    

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
}
