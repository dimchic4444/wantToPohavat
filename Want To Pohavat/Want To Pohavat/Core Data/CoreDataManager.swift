//
//  CoreDataManager.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 09/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    public static let shared = CoreDataManager()
    
    private let stack = CoreDataStack.shared
    
}

extension CoreDataManager {
    
    public func saveImage(name: String, image: Data) {
            stack.persistentContainer.performBackgroundTask { (context) in
                let imageObject = MOImage(context: context)
                imageObject.name = name
                imageObject.image = image
                do {
                    try context.save()
                    print("\(imageObject.name) save by core data")
                } catch {
                    print("Image save failed: \(error)")
                }
            }
    }
    
    public func getFetchedResultsControllerImage() -> NSFetchedResultsController<MOImage> {
        let context = stack.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MOImage>(entityName: "Image")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                    managedObjectContext: context,
                                                    sectionNameKeyPath: nil,
                                                    cacheName: nil)
        do {
            try controller.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        return controller
    }
//    public func getFetchedResultsControllerDataBase() -> NSFetchedResultsController<MODataBase> {
//        let context = stack.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<MODataBase>(entityName: "DataBase")
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "version", ascending: true)]
//        let controller = NSFetchedResultsController(fetchRequest: fetchRequest,
//                                                    managedObjectContext: context,
//                                                    sectionNameKeyPath: nil,
//                                                    cacheName: nil)
//        do {
//            try controller.performFetch()
//        } catch {
//            fatalError("Failed to fetch entities: \(error)")
//        }
//        return controller
//    }
    public func deleteImagesFromCoreData () {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try stack.persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: stack.persistentContainer.viewContext)
        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
}
