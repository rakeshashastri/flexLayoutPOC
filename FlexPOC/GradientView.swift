//
//  GradientView.swift
//  FlexPOC
//
//  Created by Rakesha Shastri on 03/05/21.
//

import UIKit

class GradientView: UIView {
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.backgroundColor = UIColor.green.cgColor
        return gradientLayer
    }()
    
    lazy var dummyView = UIView()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "zoho"))
        imageView.isOpaque = false
        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.insertSublayer(gradientLayer, at: 0)
        addSubview(imageView)
//        insertSubview(imageView, at: 0)
        addSubview(dummyView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        
        imageView.pin.top().left().right().bottom()
        dummyView.pin.top().left().right().bottom()
    }
        
}

