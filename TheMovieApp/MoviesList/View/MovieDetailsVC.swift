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
    var similarMovies = [Movie]()
    
    let moviePresenter = MoviePresenter()
    var numberOfTVRows = 3

    @IBOutlet weak var movieDetailsTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieDetailsTV.delegate = self
        movieDetailsTV.dataSource = self
        movieDetailsTV.rowHeight = UITableView.automaticDimension
        movieDetailsTV.estimatedRowHeight = 60
        
        title = movieDetails.title
        getSimilarMovies()
    }
    
    func getSimilarMovies(){
        if isNetworkReachable {
            self.showLoader()
            moviePresenter.moviesList(movieId: movieDetails.id ?? 0, onSuccess: { (movies) in
                self.similarMovies = movies
                self.numberOfTVRows += movies.count + 1
                self.movieDetailsTV.reloadData()
                self.hideLoader()
            }) { (errorMessage) in
                self.hideLoader()
                self.showAlert(title: "", message: errorMessage ?? "Error", shouldpop: false)
            }
        }else{
            self.showAlert(title: "", message: "No, Internet connection", shouldpop: false)
        }
    }
}

extension MovieDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfTVRows
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
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "overViewCell", for: indexPath) as! overViewCell
            cell.configCell(overView: movieDetails.overview ?? "")
            return cell
        }else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath)
            cell.textLabel?.text = "Similar Movies"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.font = UIFont(name: "Helvetica Neue", size: 18)
            cell.textLabel?.textColor = UIColor.cyan
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarMovieCell", for: indexPath) as! SimilarMovieCell
            
            cell.configCell(movie: similarMovies[indexPath.row - 4], allGenres: genres)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            let tvheight = movieDetailsTV.frame.size.height
            let cellHeight = tvheight - (tvheight / 4)
            
            return  cellHeight
        
        }else if indexPath.row == 3{
            return CGFloat(60)
        }else if indexPath.row == 1 || indexPath.row == 2{
             return UITableView.automaticDimension
        }else {
            return CGFloat(200)
        }
    }
    
}

extension MovieDetailsVC: UITableViewDelegate {
    
}


