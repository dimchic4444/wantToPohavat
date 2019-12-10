//
//  CoreDataStack.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 09/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    public let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        let group = DispatchGroup()
        group.enter()
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
            group.leave()
        }
        group.wait()
    }
}
