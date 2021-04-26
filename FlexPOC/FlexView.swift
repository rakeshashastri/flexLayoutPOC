//
//  FlexView.swift
//  FlexPOC
//
//  Created by Rakesha Shastri on 26/04/21.
//

import UIKit

import UIKit
import FlexLayout
import PinLayout

class FlexView: UIView {
    fileprivate let contentView = UIScrollView()
    let rootFlexContainer = UIView()
    
    lazy var flexLayoutView1: FlexLayoutView = {
        let flexLayoutView = FlexLayoutView()
        flexLayoutView.backgroundColor = .blue
        flexLayoutView.translatesAutoresizingMaskIntoConstraints = false
        return flexLayoutView
    }()
    
    lazy var autoLayoutView: AutoLayoutView = {
        let autoLayoutView = AutoLayoutView()
        autoLayoutView.backgroundColor = .yellow
//        autoLayoutView.translatesAutoresizingMaskIntoConstraints = false
        return autoLayoutView
    }()
    
    lazy var flexLayoutView2: FlexLayoutView = {
        let flexLayoutView = FlexLayoutView()
        flexLayoutView.backgroundColor = .blue
        flexLayoutView.translatesAutoresizingMaskIntoConstraints = false
        return flexLayoutView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .black
        
        contentView.addSubview(rootFlexContainer)
        addSubview(contentView)
        
        rootFlexContainer.flex.addItem().backgroundColor(.green).addItem(flexLayoutView1).width(100).minHeight(10)
        rootFlexContainer.flex.addItem().backgroundColor(.orange).addItem(autoLayoutView).width(100).minHeight(10)
        rootFlexContainer.flex.addItem().backgroundColor(.green).addItem(flexLayoutView2).width(100).minHeight(10)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        debugPrint("Drawing \(self)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // 1) Layout the contentView & rootFlexContainer using PinLayout
        contentView.pin.all(pin.safeArea)
        rootFlexContainer.pin.top().left().right()

        // 2) Let the flexbox container layout itself and adjust the height
        rootFlexContainer.flex.layout(mode: .adjustHeight)
        
        // 3) Adjust the scrollview contentSize
        contentView.contentSize = rootFlexContainer.frame.size
    }
    
}
