//
//  ExampleNibCell.swift
//  YHTableExample
//
//  Created by chenyehong on 2021/11/10.
//

import UIKit

class ExampleNibCell: UITableViewCell {

    @IBOutlet weak var lb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
