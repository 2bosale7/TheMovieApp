//
//  MoviePresenter.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/22/20.
//  Copyright © 2020 me. All rights reserved.
//

import Foundation
import SwiftyJSON

class MoviePresenter:NSObject {
    
    func moviesList(movieId:Int?, onSuccess: @escaping ([Movie]) -> Void, onFailure: @escaping (String?) -> Void ) -> Void
    {
        var url = ""
        if let id = movieId {
             url = URLManager().getSimilarMovies(movieId: id)
        }else{
             url = URLManager().getNowPlayingMovies()
        }
        
        ServiceManager.callAPI(url: url, method: .get, parameters: nil, custumHeaders: nil) { (error, response) in
            if response != nil
            {
                let totalResults = response!["total_results"].intValue
                if totalResults > 1  {
                    var nowPlayingMovies = [Movie]()
                    let results = response!["results"].arrayValue
                    for result in results {
                        nowPlayingMovies.append(Movie(parametersJson: result.dictionaryValue))
                    }
                    
                    onSuccess(nowPlayingMovies)
                }else{
                    let errorMessage = response!["status_message"].stringValue
                    onFailure(errorMessage)
                }
            }
            else
            {
                onFailure("حدث خطأ الرجاء المحاولة مرة اخرى")
            }
        }
    }
    
    func genres(onSuccess: @escaping ([Genre]) -> Void, onFailure: @escaping (String?) -> Void ) -> Void
    {
        let url = URLManager().getGenres()
        
        ServiceManager.callAPI(url: url, method: .get, parameters: nil, custumHeaders: nil) { (error, response) in
            if response != nil
            {
                var genres = [Genre]()
                let results = response!["genres"].arrayValue
                for result in results {
                    genres.append(Genre(parametersJson: result.dictionaryValue))
                }
                onSuccess(genres)
            }
            else
            {
                onFailure("حدث خطأ الرجاء المحاولة مرة اخرى")
            }
        }
    }
    
    func getGenersTitles(allGenres: [Genre], movieGenres: [Int]) -> String {
        return Genre().getGenersTitles(allGenres: allGenres, movieGenres: movieGenres)
    }
}
