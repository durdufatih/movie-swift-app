//
//  CoreDataService.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 18.01.2023.
//

import UIKit

final class CoreDataService{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getResultOfData(completion:@escaping ([FilmDB])->Void){
        do{
            let filmData = try context.fetch(FilmDB.fetchRequest())
            completion(filmData)
        }catch{
            print("Error")
        }
    }
    
    func saveData(title:String,description:String,completion:@escaping (Bool)->Void){
        let newItem = FilmDB(context: context)
        newItem.title = title
        newItem.descriptionText = description
        do{
            try context.save()
            completion(true)
        }
        catch
        {
            print("Save Error")
        }
    }
}
