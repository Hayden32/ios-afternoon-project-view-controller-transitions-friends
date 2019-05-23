//
//  FriendsModel.swift
//  Friends
//
//  Created by Hayden Hastings on 5/23/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class FriendsModel: NSObject {
    
    var friends: [Friends] = []
    var friendsTableViewCell = FriendsTableViewCell()
    
    override init() {
        super.init()
        loadImage()
    }
    
    func loadImage() {
        for n in 1...2 {
            let imageName = "Image\(n)"
            
            guard let image = UIImage(named: imageName) else { continue }
            let friend = Friends(image: image)
            
            friends.append(friend)
        }
    }
    
    
}
