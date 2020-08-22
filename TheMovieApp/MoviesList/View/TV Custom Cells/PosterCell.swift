//
//  PosterCell.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/23/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit
import SDWebImage

class PosterCell: UITableViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var avargeRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(poster:String, avargeRate:Double) {
        self.poster.sd_setImage(with: URL(string: poster))
        self.avargeRate.text = "Avarage Rate: " + String(avargeRate)
    }
}
