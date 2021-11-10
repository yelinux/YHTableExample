//
//  ViewController.swift
//  YHTableExample
//
//  Created by chenyehong on 2021/11/9.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView = UITableView.init(frame: CGRect.zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
        
        tableView.dataDelegate = YHTbBaseDelegate.init()
        
        tableView.dataDelegate?.sectionModels.removeAll()
        let sectionModel = tableView.dataDelegate?.createSectionModel()
        
        sectionModel?.createNibHeader(anyClass: ExampleNibHeader.self).dequeueReusable(setDataBlock: { view in
            let header = view as! ExampleNibHeader
            header.lb.text = "这是header"
        }, height: 50)
        
        for i in 0...5 {
            sectionModel?.createRow(anyClass: ExampleCell.self).dequeueReusable(setDataBlock: { view in
                let cell = view as! ExampleCell
                cell.lb.text = "这是cell \(i)"
            }, height: 50)
        }
        
        sectionModel?.createFooter(anyClass: ExampleFooter.self).dequeueReusable(setDataBlock: { view in
            let footer = view as! ExampleFooter
            footer.lb.text = "这是footer"
        }, height: 50)
    }
}

