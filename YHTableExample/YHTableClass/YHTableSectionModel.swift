//
//  YHTableSectionModel.swift
//  YHTableExample
//
//  Created by chenyehong on 2021/11/9.
//

import UIKit

class YHTableSectionModel: NSObject {
    
    weak var tableView : UITableView?

    var headerModel : YHTableItemModel?
    var rowModels : [YHTableItemModel] = []
    var footerModel : YHTableItemModel?
    
    init(tableView : UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    func createHeader(anyClass : AnyClass) -> YHTableItemModel{
        tableView?.register(headerFooter: anyClass)
        return self.createHeader(reusableIdentifier: String(describing: anyClass))
    }
    
    func createNibHeader(anyClass : AnyClass) -> YHTableItemModel{
        tableView?.register(nibHeaderFooter: anyClass)
        return self.createHeader(reusableIdentifier: String(describing: anyClass))
    }
    
    func createHeader(reusableIdentifier : String) -> YHTableItemModel{
        self.headerModel = YHTableItemModel.init(reusableIdentifier: reusableIdentifier)
        return self.headerModel!
    }
    
    func createFooter(anyClass : AnyClass) -> YHTableItemModel{
        tableView?.register(headerFooter: anyClass)
        return self.createFooter(reusableIdentifier: String(describing: anyClass))
    }
    
    func createNibFooter(anyClass : AnyClass) -> YHTableItemModel{
        tableView?.register(nibHeaderFooter: anyClass)
        return self.createFooter(reusableIdentifier: String(describing: anyClass))
    }

    func createFooter(reusableIdentifier : String) -> YHTableItemModel{
        self.footerModel = YHTableItemModel.init(reusableIdentifier: reusableIdentifier)
        return self.footerModel!
    }
    
    func createRow(anyClass : AnyClass) -> YHTableItemModel{
        tableView?.register(cell: anyClass)
        return self.createRow(reusableIdentifier: String(describing: anyClass))
    }
    
    func createNibRow(anyClass : AnyClass) -> YHTableItemModel{
        tableView?.register(nibCell: anyClass)
        return self.createRow(reusableIdentifier: String(describing: anyClass))
    }
    
    func createRow(reusableIdentifier : String) -> YHTableItemModel{
        let model = YHTableItemModel.init(reusableIdentifier: reusableIdentifier)
        self.rowModels.append(model)
        return model
    }
}
