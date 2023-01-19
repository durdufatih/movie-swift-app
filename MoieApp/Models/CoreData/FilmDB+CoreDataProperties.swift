//
//  FilmDB+CoreDataProperties.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 18.01.2023.
//
//

import Foundation
import CoreData


extension FilmDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FilmDB> {
        return NSFetchRequest<FilmDB>(entityName: "FilmDB")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var descriptionText: String?

}

extension FilmDB : Identifiable {

}
