//
//  URLManager.swift
//  NY Times MPA
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import Foundation

enum AppEnvironments {
    case development, production
}

class URLManager {
    
    let apiAccessKey = "Authorization"
    let apiAccessKeyValue = ""
    let imageBaseURL = "https://image.tmdb.org/t/p/w500"
    private let currentWorkingEnvironment = AppEnvironments.development
    
    private var developmentServerBaseURL:String
    {
        return "https://api.themoviedb.org/3"
    }
    
    private var ProducationServerBaseURL:String
    {
        return "https://api.themoviedb.org/3"
    }
    
    private func getCurrentBaseUrl() -> String{
        if currentWorkingEnvironment == .development {
            return developmentServerBaseURL
        }else{
            return ProducationServerBaseURL
        }
    }
    
    
    func getNowPlayingMovies() -> String {
        return "\(getCurrentBaseUrl())/movie/now_playing?api_key=18946364666c55b73b60bce5003b901c&language=en-US&page=1"
    }
    
    func getGenres() -> String {
        return "\(getCurrentBaseUrl())/genre/movie/list?api_key=18946364666c55b73b60bce5003b901c&language=en-US"
    }
}
