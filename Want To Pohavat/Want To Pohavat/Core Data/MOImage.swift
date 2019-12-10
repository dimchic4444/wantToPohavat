//
//  MOImage.swift
//  Want To Pohavat
//
//  Created by Дмитрий Гришин on 09/12/2019.
//  Copyright © 2019 Дмитрий Гришин. All rights reserved.
//

import Foundation
import CoreData

@objc(MOImage)
final class MOImage: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var image: Data
    
}
