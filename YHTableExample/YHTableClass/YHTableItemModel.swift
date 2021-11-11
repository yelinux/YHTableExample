//
//  YHTableItemModel.swift
//  YHTableExample
//
//  Created by chenyehong on 2021/11/9.
//

import UIKit

class YHTableItemModel <T : UIView> : NSObject, YHTbModProtocal {

    typealias SetDataBlock = (_ view : T) -> Void
    
    let reusableIdentifier : String
    var setDataBlock : SetDataBlock?
    var estimatedHeightBlock : YHHeightBlock
    var heightBlock : YHHeightBlock
    var setHeightBlock : YHSetHeightBlock?
    
    func setData(view: UIView) {
        if let v = view as? T {
            self.setDataBlock?(v)
        }
    }
    
    override init() {
        self.reusableIdentifier = String(describing: T.self)
        self.heightBlock = {
            return UITableView.automaticDimension
        }
        self.estimatedHeightBlock = {
            return CGFloat.leastNormalMagnitude
        }
        super.init()
    }
    
    convenience init(setDataBlock : @escaping SetDataBlock,
                     estimatedHeightBlock : @escaping YHHeightBlock,
                     heightBlock : @escaping YHHeightBlock,
                     setHeightBlock : @escaping YHSetHeightBlock) {
        self.init()
        self.setDataBlock = setDataBlock
        self.estimatedHeightBlock = estimatedHeightBlock
        self.heightBlock = heightBlock
        self.setHeightBlock = setHeightBlock
    }
    
    convenience init(setDataBlock : @escaping SetDataBlock,
                     height : CGFloat) {
        self.init()
        self.setDataBlock = setDataBlock;
        self.estimatedHeightBlock = {
            return height
        }
        self.heightBlock = {
            return height
        }
        self.setHeightBlock = nil;
    }
}
