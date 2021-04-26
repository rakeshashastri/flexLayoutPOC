//
//  FlexLayoutView.swift
//  FlexPOC
//
//  Created by Rakesha Shastri on 26/04/21.
//

import UIKit
import PinLayout

class FlexLayoutView: UIView {
    
    lazy var rootFlexContainer = UIView()
    
    //MARK: UI Element(s)
    lazy var field: UILabel = {
        let label = UILabel()
        label.text = "<label>"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    lazy var value: UILabel = {
        let label = UILabel()
        label.text = "<value>"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
    }
    
    func addSubviews() {
        addSubview(rootFlexContainer)
        rootFlexContainer.flex.direction(.row).define { (flex) in
            flex.addItem().direction(.column).define { (flex) in
                flex.addItem(field)
            }
            flex.addItem().direction(.column).shrink(1).paddingLeft(5).define { (flex) in
                flex.addItem(value).shrink(1)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rootFlexContainer.pin.top().left().width(100%)
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        debugPrint("Drawing \(self)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
