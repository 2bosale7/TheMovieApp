//
//  overViewCell.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/23/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit

class overViewCell: UITableViewCell {

    @IBOutlet weak var overView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(overView:String) {
        self.overView.text = overView
    }
}
