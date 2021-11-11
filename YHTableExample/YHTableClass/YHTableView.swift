//
//  ExtensionTableView.swift
//  YHTableExample
//
//  Created by chenyehong on 2021/11/10.
//

import UIKit

extension UITableView {
    
    func register(headerFooter : AnyClass) {
        let key = String(describing: headerFooter)
        if !registerSet.contains(key) {   
            if Bundle.main.path(forResource: key, ofType: "nib") != nil {
                self.register(UINib.init(nibName: key, bundle: nil), forHeaderFooterViewReuseIdentifier: key)
            } else {
                self.register(headerFooter, forHeaderFooterViewReuseIdentifier: key)
            }
            registerSet.add(key)
        }
    }
    
    func register(cell : AnyClass) {
        let key = String(describing: cell)
        if !registerSet.contains(key) {
            if Bundle.main.path(forResource: key, ofType: "nib") != nil {
                self.register(UINib.init(nibName: key, bundle: nil), forCellReuseIdentifier: key)
            } else {
                self.register(cell, forCellReuseIdentifier: key)
            }
            registerSet.add(key)
        }
    }
    
    private var registerSet: NSMutableSet {
        let rgtSet: NSMutableSet
        
        if let existing = objc_getAssociatedObject(self, &registerSetKey) as? NSMutableSet {
            rgtSet = existing
        } else {
            rgtSet = NSMutableSet()
            objc_setAssociatedObject(self, &registerSetKey, rgtSet, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return rgtSet
    }
    
    var dataDelegate: YHTbBaseDelegate? {
        get {
            return objc_getAssociatedObject(self, &dataDelegateKey) as? YHTbBaseDelegate
        }
        set {
            objc_setAssociatedObject(self, &dataDelegateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            newValue?.tableView = self
            self.delegate = newValue;
            self.dataSource = newValue
            newValue?.configTableView()
        }
    }
}

private var registerSetKey: UInt8 = 0
private var dataDelegateKey: UInt8 = 0
