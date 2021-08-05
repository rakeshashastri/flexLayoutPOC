//
//  ViewController.swift
//  FlexPOC
//
//  Created by Rakesha Shastri on 26/04/21.
//

import UIKit
import FlexLayout
import PinLayout

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
    
    lazy var testView = UIView(frame: CGRect(x: 0, y: 200, width: 400, height: 450))
    lazy var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    lazy var backgroundLayer: CALayer = {
        let layer = CALayer()
        return layer
    }()
    
    
    lazy var flexView = AutoLayoutView()

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.addSubview(gradientView)
        view.addSubview(imageView)
        view.addSubview(testView)
//        NSLayoutConstraint.activate([
//            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            gradientView.topAnchor.constraint(equalTo: view.topAnchor)
//        ])
        testView.layer.addSublayer(backgroundLayer)
        backgroundLayer.backgroundColor = UIColor.red.cgColor
        addBase64Image()
        
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
    
    func addBase64Image() {
        let imageData = "https://lh3.googleusercontent.com/u8yWOp5E-tNHnRjWCMhOJknhTCBk9y0u-ZVUEc4w331f7nf6NZhInesTddwuxF2JprYjpjZesO2pElIc5Erq0pUGWQ=w128-h128-e365-rj-sc0x00ffffff"
        let urlRequest = URLRequest(url: URL(string: imageData)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
//                let newImage = image!.resizableImage(withCapInsets: .zero, resizingMode: .tile)
//                self.imageView.image = newImage
                let mirroredImage = UIImage(cgImage: image!.cgImage!, scale: image!.scale, orientation: .downMirrored)
//                let scale = image!.scale
//                let size = image!.size
                UIGraphicsBeginImageContext(image!.size)
                UIGraphicsGetCurrentContext()?.draw(image!.cgImage!, in: CGRect(x: 0.0, y: 0.0, width: image!.size.width, height: image!.size.height))
                let upsideDownImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                self.backgroundLayer.backgroundColor = UIColor(patternImage: upsideDownImage!).cgColor
                self.imageView.image = upsideDownImage
//                self.backgroundLayer.transform = CATransform3DMakeScale(1.0, -1.0, 1.0)
            }
        }
        task.resume()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundLayer.frame = testView.frame
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
 
