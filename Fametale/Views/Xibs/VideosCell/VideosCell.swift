//
//  VideosCell.swift
//  Fametale
//
//  Created by Callsoft on 09/06/18.
//  Copyright © 2018 Callsoft. All rights reserved.
//

import UIKit

class VideosCell: UITableViewCell {

    //MARK:- OUTLETS
    @IBOutlet weak var imgVideo: UIImageView!
    
    @IBOutlet weak var btnShareRef: UIButton!
    @IBOutlet weak var btnDownloadRef: UIButton!
    @IBOutlet weak var btnCommentRef: UIButton!
    @IBOutlet weak var btnRatingRef: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
