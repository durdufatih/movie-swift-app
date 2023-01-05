//
//  FilmModel.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 6.01.2023.
//

import Foundation

class FilmModel{
    
    public var imageUrl:String
    public var title:String
    public var rateString:String
    
    init(imageUrl: String, title: String, rateString: String) {
        self.imageUrl = imageUrl
        self.title = title
        self.rateString = rateString
    }
}
