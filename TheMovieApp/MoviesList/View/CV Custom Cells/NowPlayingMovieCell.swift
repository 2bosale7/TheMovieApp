//
//  NowPlayingMovieCell.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/22/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit
import SDWebImage

class NowPlayingMovieCell: UICollectionViewCell {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var avargeRate: UILabel!
    @IBOutlet weak var titleContainer: UIView!
    
    func configCell(movie:Movie) {
        poster.sd_setImage(with: URL(string: movie.poster_path ?? ""))
        title.text = movie.title
        releaseDate.text = movie.release_date
        avargeRate.text = "Avarage Rate: " + String(movie.vote_average ?? 0.0)
        
        poster.layer.cornerRadius = 5
        poster.clipsToBounds = true
        titleContainer.layer.cornerRadius = 5
    }
    
}
