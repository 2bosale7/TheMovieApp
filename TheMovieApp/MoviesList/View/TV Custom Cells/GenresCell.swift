//
//  GenresCell.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/23/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit

class GenresCell: UITableViewCell {

    @IBOutlet weak var geners: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(releaseDate:String, genres:String) {
        self.geners.text = releaseDate + "  ●  " + genres
    }
}
