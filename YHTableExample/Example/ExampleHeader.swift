//
//  ExampleHeader.swift
//  YHTableExample
//
//  Created by chenyehong on 2021/11/9.
//

import UIKit

class ExampleHeader: UITableViewHeaderFooterView {
    
    let lb = UILabel.init()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        lb.textColor = UIColor.black
        lb.text = "header"
        self.contentView.addSubview(lb)
        lb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lb.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
            lb.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0),
            lb.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            lb.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
