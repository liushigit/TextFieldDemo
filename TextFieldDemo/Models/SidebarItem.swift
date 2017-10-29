//
//  SidebarItem.swift
//  TextFieldDemo
//
//  Created by Shi on 29/10/2017.
//  Copyright © 2017 Shi. All rights reserved.
//

import Foundation

protocol SidebarItem : AnyObject {
    var title : String {
        get
        set
    }
    
    var children : [SidebarItem]? {
        get
        set
    }
}

