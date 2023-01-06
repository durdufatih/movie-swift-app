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
    public var tag:String
    public var length:String
    
    init(imageUrl: String, title: String, rateString: String, tag: String, length: String) {
        self.imageUrl = imageUrl
        self.title = title
        self.rateString = rateString
        self.tag = tag
        self.length = length
    }
}
