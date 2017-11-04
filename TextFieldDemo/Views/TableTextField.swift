//
//  TableTextField.swift
//  Offline Disks File Searcher
//
//  Created by Shi on 2017/10/20.
//  Copyright © 2017年 Shi Liu. All rights reserved.
//

import Cocoa


//extension String {
//    func size(withConstrainedHeight height: CGFloat, font: NSFont) -> CGSize {
//        let constraintSize = CGSize(width: .greatestFiniteMagnitude,
//                                    height: height)
//        let boundingBox = self.bou
//        let att
//    }
//}

extension NSAttributedString {
    func size(withConstrainedHeight height: CGFloat, font: NSFont) -> CGSize {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude,
                                    height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin)
        let size = boundingBox.size
        return CGSize(width: size.width, height: size.height)
    }
}

class TableTextField: NSTextField {
    var isEditing = false

    // The text will jiggle a little bit during editing.
    // Still not a good solution.
    // Checkout the initial commit to see the original implementation.
    override var intrinsicContentSize: NSSize {
        if isEditing {
            if let fieldEditor =
                self.window?.fieldEditor(false, for: self) as?
                    NSTextView
            {
                return attributedStringValue.size(
                    withConstrainedHeight: 1000,
                    font: fieldEditor.font!)
            }
        }
        return self.cell!.cellSize
    }
    
    override var alignmentRectInsets: NSEdgeInsets {
        return NSEdgeInsets(top: 0.0,
                            left: 4.0,
                            bottom: 0.0,
                            right: 4.0)
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
