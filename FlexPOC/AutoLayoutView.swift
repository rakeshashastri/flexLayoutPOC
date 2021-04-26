//
//  AutoLayoutView.swift
//  FlexPOC
//
//  Created by Rakesha Shastri on 26/04/21.
//

import UIKit

class AutoLayoutView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    lazy var field: UILabel = {
//        let label = UILabel()
//        label.text = "<label>"
//        label.numberOfLines = 0
//        label.font = .systemFont(ofSize: 15, weight: .regular)
//        label.setContentHuggingPriority(.defaultLow, for: .vertical)
//        label.setContentCompressionResistancePriority(.required, for: .horizontal)
//        label.setContentCompressionResistancePriority(.required, for: .vertical)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    lazy var value: UILabel = {
        let label = UILabel()
        label.text = "<value>"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var leftConstraints: [NSLayoutConstraint] = [
//        field.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//        field.topAnchor.constraint(equalTo: containerView.topAnchor),
        
        value.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
        value.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        value.topAnchor.constraint(equalTo: containerView.topAnchor),
        value.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        containerView.topAnchor.constraint(equalTo: topAnchor),
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
//        containerView.addSubview(field)
        containerView.addSubview(value)
        NSLayoutConstraint.activate(leftConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        containerView.pin.all()
//        NSLayoutConstraint.activate(leftConstraints)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        debugPrint("Drawing \(self)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
