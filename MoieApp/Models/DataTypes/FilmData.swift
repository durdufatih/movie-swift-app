//
//  FilmData.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 9.01.2023.
//

import Foundation

struct FilmData : Codable {
    let adult : Bool
    let backdrop_path : String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path : String
    let release_date : String
    let title : String
    let video : Bool
    let vote_average : Double
    let vote_count : Int
}



/*
 
 
 "adult": false,
             "backdrop_path": "/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg",
             "genre_ids": [
                 878,
                 12,
                 28
             ],
             "id": 76600,
             "original_language": "en",
             "original_title": "Avatar: The Way of Water",
             "overview": "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
             "popularity": 5359.253,
             "poster_path": "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
             "release_date": "2022-12-14",
             "title": "Avatar: The Way of Water",
             "video": false,
             "vote_average": 7.7,
             "vote_count": 3830
 */
