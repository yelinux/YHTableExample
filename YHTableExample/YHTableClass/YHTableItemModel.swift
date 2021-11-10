//
//  YHTableItemModel.swift
//  YHTableExample
//
//  Created by chenyehong on 2021/11/9.
//

import UIKit

typealias YHHeightBlock = () -> CGFloat
typealias YHSetHeightBlock = (_ height : CGFloat) -> Void
typealias SetDataBlock = (_ view : UIView) -> Void

class YHTableItemModel : NSObject {
    
    let reusableIdentifier : String
    var setDataBlock : SetDataBlock?
    var estimatedHeightBlock : YHHeightBlock
    var heightBlock : YHHeightBlock
    var setHeightBlock : YHSetHeightBlock?
    
    init(reusableIdentifier : String) {
        self.reusableIdentifier = reusableIdentifier//String(describing: T.self)
        self.heightBlock = {
            return UITableView.automaticDimension
        }
        self.estimatedHeightBlock = {
            return CGFloat.leastNormalMagnitude
        }
        super.init()
    }
    
    func dequeueReusable(setDataBlock : @escaping SetDataBlock,
                         estimatedHeightBlock : @escaping YHHeightBlock,
                         heightBlock : @escaping YHHeightBlock,
                         setHeightBlock : @escaping YHSetHeightBlock) {
        self.setDataBlock = setDataBlock
        self.estimatedHeightBlock = estimatedHeightBlock
        self.heightBlock = heightBlock
        self.setHeightBlock = setHeightBlock
    }
    
    func dequeueReusable(setDataBlock : @escaping SetDataBlock,
                         height : CGFloat) {
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
