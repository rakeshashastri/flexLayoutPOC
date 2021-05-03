//
//  ViewController.swift
//  FlexPOC
//
//  Created by Rakesha Shastri on 26/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var containerView: FlexView = {
        let view = FlexView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gradientView: GradientView = {
        let gradientView = GradientView()
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        return gradientView
    }()
    
    
    
    lazy var flexView = AutoLayoutView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        
//        view.addSubview(flexView)
//        flexView.frame = CGRect(x: 100, y: 100, width: 100, height: 10)
//        flexView.backgroundColor = .red
//        NSLayoutConstraint.activate([
//            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
//            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
//        ])
//        containerView.addSubview(flexView)
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
