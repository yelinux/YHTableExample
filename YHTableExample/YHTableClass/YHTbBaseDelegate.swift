//
//  YHTbBaseDelegate.swift
//  YHTableExample
//
//  Created by chenyehong on 2021/11/9.
//

import UIKit

class YHTbBaseDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {

    weak var tableView : UITableView?
    
    var sectionModels : [YHTableSectionModel] = []
    
    func configTableView(){
        tableView?.estimatedRowHeight = 0
        tableView?.estimatedSectionHeaderHeight = 0
        tableView?.estimatedSectionFooterHeight = 0
    }
    
    func createSectionModel() -> YHTableSectionModel {
        let sectionModel = YHTableSectionModel.init(tableView: tableView!)
        sectionModels.append(sectionModel)
        return sectionModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectionModels[section].rowModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.sectionModels[section].headerModel?.heightBlock() ?? CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerModel = self.sectionModels[section].headerModel {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerModel.reusableIdentifier)!
            headerModel.setDataBlock?(view)
            return view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.sectionModels[section].footerModel?.heightBlock() ?? CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let footerModel = self.sectionModels[section].footerModel {
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerModel.reusableIdentifier)!
            footerModel.setDataBlock?(view)
            return view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.sectionModels[indexPath.section].rowModels[indexPath.row].heightBlock()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowModel = self.sectionModels[indexPath.section].rowModels[indexPath.row]
        let cell = tableView .dequeueReusableCell(withIdentifier: rowModel.reusableIdentifier, for: indexPath)
        rowModel.setDataBlock?(cell)
        return cell
    }
}

class YHTbEstimatedDelegate : YHTbBaseDelegate {
    
    override func configTableView() {
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.sectionModels[section].headerModel?.estimatedHeightBlock() ?? CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.sectionModels[indexPath.section].rowModels[indexPath.row].estimatedHeightBlock()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return self.sectionModels[section].footerModel?.estimatedHeightBlock() ?? CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let height = view.frame.size.height
        if height > 0 {
            self.sectionModels[section].headerModel?.setHeightBlock?(height)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let height = cell.frame.size.height
        if height > 0 {
            self.sectionModels[indexPath.section].rowModels[indexPath.row].setHeightBlock?(height)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let height = view.frame.size.height
        if height > 0 {
            self.sectionModels[section].footerModel?.setHeightBlock?(height)
        }
    }
}
