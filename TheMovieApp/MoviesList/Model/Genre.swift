//
//  Genre.swift
//  TheMovieApp
//
//  Created by Mohammed Saleh on 8/22/20.
//  Copyright © 2020 me. All rights reserved.
//

import Foundation
import SwiftyJSON

class Genre:NSObject {
    var id:Int?
    var name:String?
    
    override init() { }
    
    init(parametersJson:[String:JSON]) {
        
        if let id = parametersJson["id"]?.intValue {
            self.id = id
        }
        
        if let name = parametersJson["name"]?.stringValue {
            self.name = name
        }
    }
    
    func getGenersTitles(allGenres: [Genre], movieGenres: [Int]) -> String {
        var genersTitle = ""
        for genreId in movieGenres {
            for allGenre in allGenres {
                if allGenre.id == genreId {
                    genersTitle += (allGenre.name ?? "") + ", "
                }
            }
        }
        return String(genersTitle.dropLast().dropLast())
    }
}
