//
//  ViewController.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/22/20.
//  Copyright © 2020 me. All rights reserved.
//

import UIKit

class NowPlayingMovies: ParentViewController {
    
    let moviePresenter = MoviePresenter()
    var nowPlayingMovies = [Movie]()
    var genres = [Genre]()
    
    @IBOutlet weak var nowPlayingMoviesCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Now Playing Movies"
        
        nowPlayingMoviesCV.delegate = self
        nowPlayingMoviesCV.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getNowPlayingMovies()
    }
    
    
    func getNowPlayingMovies(){
        if isNetworkReachable {
            self.showLoader()
            moviePresenter.nowPlayingMovies(onSuccess: { (movies) in
                self.nowPlayingMovies = movies
                self.nowPlayingMoviesCV.reloadData()
                self.hideLoader()
                self.getGenres()
            }) { (errorMessage) in
                self.hideLoader()
                self.showAlert(title: "", message: errorMessage ?? "Error", shouldpop: false)
            }
        }else{
            self.showAlert(title: "", message: "No, Internet connection", shouldpop: false)
        }
    }
    
    func getGenres() {
        moviePresenter.genres(onSuccess: { (genres) in
            self.genres = genres
        }) { (errorMessage) in
            print(errorMessage ?? "Error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieDetails" {
            let index = sender as! Int
            let dest = segue.destination as! MovieDetailsVC
            dest.movieDetails = nowPlayingMovies[index]
            dest.genres = genres
        }
    }
}

extension NowPlayingMovies: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowPlayingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NowPlayingMovieCell", for: indexPath) as! NowPlayingMovieCell
        cell.configCell(movie: nowPlayingMovies[indexPath.row])
        return cell
    }
}

extension NowPlayingMovies: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.size.width - 24) / 2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

extension NowPlayingMovies: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMovieDetails", sender: indexPath.row)
    }
}


