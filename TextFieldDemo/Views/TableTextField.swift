//
//  TableTextField.swift
//  Offline Disks File Searcher
//
//  Created by Shi on 2017/10/20.
//  Copyright © 2017年 Shi Liu. All rights reserved.
//

import Cocoa

class TableTextField: NSTextField {
    var isEditing = false

/*
    override func setFrameSize(_ newSize: NSSize) {
        if let editor = self.currentEditor() as? NSTextView {
            editor.invalidateTextContainerOrigin()
        }
        
        super.setFrameSize(newSize)
    }

    override var frame: NSRect {
        set {
            if let editor = self.currentEditor() as? NSTextView {
                editor.invalidateTextContainerOrigin()
            }
            super.frame = newValue
        }
        
        get {
            return super.frame
        }
    }
*/
    override var intrinsicContentSize: NSSize {
        if isEditing {
            if let fieldEditor =
                self.window?.fieldEditor(false, for: self) as?
                    NSTextView
            {
                // Approach #1
//                let cell = NSTextFieldCell(textCell: fieldEditor.string)
//                cell.stringValue = fieldEditor.string
//                cell.lineBreakMode = .byClipping
//                cell.usesSingleLineMode = true
//                cell.wraps = false
//                var size = cell.cellSize
//                size.width += 5.0
//                size.height += 1.0
                
                // Approach #2
                let rect = fieldEditor.layoutManager!.usedRect(
                    for: fieldEditor.textContainer!
                )
                
                let size = rect.size
                #if DEBUG
                    print(#file, #line, size)
                #endif

                return size
                // Approach #3
//                let cellCopy = self.cell!.copy() as! NSTextFieldCell
//                cellCopy.stringValue = fieldEditor.string
//                return cellCopy.cellSize
            }
        }
        return self.cell!.cellSize
    }
    
    override func textDidBeginEditing(_ notification: Notification) {
        super.textDidBeginEditing(notification)
        isEditing = true
    }
    
    override func textDidEndEditing(_ notification: Notification) {
        super.textDidEndEditing(notification)
        isEditing = false
    }
    
    override func textDidChange(_ notification: Notification) {
        super.textDidChange(notification)
        self.invalidateIntrinsicContentSize()
    }
}
