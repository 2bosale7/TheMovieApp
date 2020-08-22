//
//  NowPlayingMovies.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/22/20.
//  Copyright © 2020 me. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie:NSObject {
    var popularity:Double?
    var vote_count:Int?
    var video:Bool?
    var poster_path:String?
    var id:Int?
    var adult:Bool?
    var backdrop_path:String?
    var original_language:String?
    var title:String?
    var genre_ids = [Int]()
    var vote_average:Double?
    var overview:String?
    var release_date:String?

    
    init(parametersJson:[String:JSON]) {
        if let popularity = parametersJson["popularity"]?.doubleValue {
            self.popularity = popularity
        }
        
        if let vote_count = parametersJson["vote_count"]?.intValue {
            self.vote_count = vote_count
        }
        
        if let video = parametersJson["video"]?.boolValue {
            self.video = video
        }
        
        if let poster_path = parametersJson["poster_path"]?.stringValue {
            self.poster_path = URLManager().imageBaseURL + poster_path
        }
        
        if let id = parametersJson["id"]?.intValue {
            self.id = id
        }
        
        if let adult = parametersJson["adult"]?.boolValue {
            self.adult = adult
        }
        
        if let backdrop_path = parametersJson["backdrop_path"]?.stringValue {
            self.backdrop_path = URLManager().imageBaseURL + backdrop_path
        }
        
        if let original_language = parametersJson["original_language"]?.stringValue {
            self.original_language = original_language
        }
        
        if let title = parametersJson["title"]?.stringValue {
            self.title = title
        }
        
        if let genre_ids = parametersJson["genre_ids"]?.arrayValue {
            for id in  genre_ids {
                self.genre_ids.append(id.intValue)
            }
        }
        
        if let vote_average = parametersJson["vote_average"]?.doubleValue {
            self.vote_average = vote_average
        }
        
        if let overview = parametersJson["overview"]?.stringValue {
            self.overview = overview
        }
        
        if let release_date = parametersJson["release_date"]?.stringValue {
            self.release_date = release_date
        }
        
    }
}
