//
//  MODataBase.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 10/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//


import Foundation
import CoreData

@objc(MOImage)
final class MODataBase: NSManagedObject {
    
    @NSManaged var version: String
    @NSManaged var codableData: Data
    
}
