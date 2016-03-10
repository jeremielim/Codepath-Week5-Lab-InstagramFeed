//
//  PhotosTableViewCell.swift
//  InstagramFeed
//
//  Created by Lim, Jeremie on 3/10/16.
//  Copyright © 2016 Jeremie Lim. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
