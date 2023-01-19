//
//  FavoritePageViewModel.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 18.01.2023.
//

import Foundation
import UIKit

final class FavoritePageViewModel{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    public var favoriteData:[FilmDB] = []
    public let coreService = CoreDataService()
    init() {
        getResultOfData { data,load in
            if load {
                self.favoriteData = data
            }
        }
    }
    
    
    func getResultOfData(completion:@escaping ([FilmDB],Bool)->Void){
        coreService.getResultOfData { result in
            completion(result,true)
        }
    }
    
    func saveData(title:String,description:String){
        coreService.saveData(title: title, description: description) { result in
            if result {
                print("Saved data")
            }
        }
    }
    
    
    
    
}
