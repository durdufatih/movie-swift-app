//
//  NowPlayingApiResponse.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 9.01.2023.
//

import Foundation

class NowApiPlayingResponse: Codable {
    let dates: DateData?
    let page : Int
    let results : [FilmData]
    let total_pages: Int
    let total_results: Int
}


/*
 
 {
     "dates": {
         "maximum": "2023-01-07",
         "minimum": "2022-11-20"
     },
     "page": 1,
     "results": [
         
     ],
     "total_pages": 87,
     "total_results": 1723
 }
 */
