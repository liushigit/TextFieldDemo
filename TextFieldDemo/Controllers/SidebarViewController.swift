//
//  SidebarViewController.swift
//  TextFieldDemo
//
//  Created by Shi on 29/10/2017.
//  Copyright © 2017 Shi. All rights reserved.
//

import Cocoa

class SidebarViewController:
    NSViewController,
    NSOutlineViewDelegate,
    NSOutlineViewDataSource
{
    
    @IBOutlet weak var outlineView: NSOutlineView!
    
    private var sidebarItems : [SidebarItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sidebarItems = [SidebarItem]()
        for _ in 1...4 {
            sidebarItems.append(SimpleSidebarItem())
        }
        
        outlineView.delegate = self
        outlineView.dataSource = self
    }
    
    // MARK: - OutlineViewDelegate

//    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
//        return false
//    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView?
    {
        return outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: nil)
    }
    
    //MARK: - OutlineViewDataSource
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int
    {
        if item == nil {
            return sidebarItems.count
        }
        
        if let children = (item as? SidebarItem)?.children {
            return children.count
        }
        
        return 0
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any
    {
        if item == nil {
            return sidebarItems[index]
        }
        return (item as! SidebarItem).children![index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, objectValueFor tableColumn: NSTableColumn?, byItem item: Any?) -> Any?
    {
        return item
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return (item as! SidebarItem).children != nil
    }
}
