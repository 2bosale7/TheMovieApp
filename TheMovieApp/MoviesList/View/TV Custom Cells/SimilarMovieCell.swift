//
//  SimilarMovieCell.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/23/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit

class SimilarMovieCell: UITableViewCell {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var avargeRate: UILabel!
    @IBOutlet weak var genres: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(movie:Movie, allGenres:[Genre]) {
        poster.sd_setImage(with: URL(string: movie.poster_path ?? ""))
        title.text = movie.title
        releaseDate.text = movie.release_date
        avargeRate.text = "Avarage Rate: " + String(movie.vote_average ?? 0.0)
        genres.text = MoviePresenter().getGenersTitles(allGenres: allGenres, movieGenres: movie.genre_ids)
        poster.layer.cornerRadius = 5
        poster.clipsToBounds = true
    }

}
