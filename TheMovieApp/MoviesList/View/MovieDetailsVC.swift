//
//  MovieDetails.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/22/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit

class MovieDetailsVC: ParentViewController {
    
    var movieDetails:Movie!
    var genres = [Genre]()

    @IBOutlet weak var movieDetailsTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieDetailsTV.delegate = self
        movieDetailsTV.dataSource = self
        movieDetailsTV.rowHeight = UITableView.automaticDimension
        movieDetailsTV.estimatedRowHeight = 60
        
        title = movieDetails.title
    }
}

extension MovieDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PosterCell", for: indexPath) as! PosterCell
            cell.configCell(poster: movieDetails.poster_path ?? "", avargeRate: movieDetails.vote_average ?? 0.0)
            return cell
        }else if indexPath.row == 1 {
            let genersTitles = MoviePresenter().getGenersTitles(allGenres: genres, movieGenres: movieDetails.genre_ids)
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenresCell", for: indexPath) as! GenresCell
            cell.configCell(releaseDate: movieDetails.release_date ?? "", genres: genersTitles)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "overViewCell", for: indexPath) as! overViewCell
            cell.configCell(overView: movieDetails.overview ?? "")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            let tvheight = movieDetailsTV.frame.size.height
            let cellHeight = tvheight - (tvheight / 4)
            
            return  cellHeight
        }else {
             return UITableView.automaticDimension
        }
        
    }
    
}

extension MovieDetailsVC: UITableViewDelegate {
    
}


