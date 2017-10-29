//
//  SimpleSidebarItem.swift
//  TextFieldDemo
//
//  Created by Shi on 29/10/2017.
//  Copyright © 2017 Shi. All rights reserved.
//

import Foundation

class SimpleSidebarItem : NSObject, SidebarItem {
    var children: [SidebarItem]?
    
    @objc dynamic var title: String = "Title"
}
