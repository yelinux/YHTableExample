//
//  YHTableSectionModel.swift
//  YHTableExample
//
//  Created by chenyehong on 2021/11/9.
//

import UIKit

class YHTableSectionModel: NSObject {
    
    weak var tableView : UITableView?

    var headerModel : YHTbModProtocal?
    var rowModels : [YHTbModProtocal] = []
    var footerModel : YHTbModProtocal?
    
    init(tableView : UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    func createHeader<T : UITableViewHeaderFooterView>(mod : YHTableItemModel<T>) {
        tableView?.register(headerFooter: T.self)
        headerModel = mod
    }
    
    func createFooter<T : UITableViewHeaderFooterView>(mod : YHTableItemModel<T>){
        tableView?.register(headerFooter: T.self)
        footerModel = mod
    }
    
    func createRow<T : UITableViewCell>(mod : YHTableItemModel<T>) {
        tableView?.register(cell: T.self)
        self.rowModels.append(mod)
    }
    
}
