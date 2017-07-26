//
//  NSCoding+Accounts.swift
//  Accounts Test
//
//  Created by Ricardo Casanova on 26/07/2017.
//  Copyright © 2017 ING. All rights reserved.
//

import Foundation

//__ Extension for NSCoding for transfer information to widget
//__ The problem is caused by swift using modulename.classname to reference a class. 
//__ A fix for that is to tell the NSKeyedArchiver and NSKeyedUnarchiver to use a different 
//__ class name for a type
//__ https://stackoverflow.com/questions/43864708/nskeyedunarchiver-unarchiveobject-fails-with-an-error-when-picking-data-from-use
extension NSCoding {
    static func registerClassName() {
        let className = NSStringFromClass(self).components(separatedBy: ".").last!
        NSKeyedArchiver.setClassName(className, for: self)
        NSKeyedUnarchiver.setClass(self, forClassName: className)
    }
}
