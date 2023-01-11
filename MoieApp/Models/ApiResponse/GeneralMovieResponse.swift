//
//  NowPlayingApiResponse.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 9.01.2023.
//

import Foundation

class GeneralMovieResponse: Codable {
    let dates: DateData?
    let page : Int
    let results : [FilmData]
    let total_pages: Int
    let total_results: Int
}
