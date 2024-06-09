//
//  RootViewController.swift
//  Priorities-v2My
//
//  Created by Usman Fayyaz on 08/06/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let sunView = UIImageView(named: "Sun", backgroundColor: .systemOrange)
    
    private let snowView = UIImageView(named: "Snow", backgroundColor: .systemBlue)
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "This label should be below the tallest of the two images"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
//        view.addSubview(sunView)
//        view.addSubview(snowView)
        view.addSubview(captionLabel)
        
        let margins = view.layoutMarginsGuide

        let captionTopConstraint = captionLabel.topAnchor.constraint(equalTo: margins.topAnchor)
        captionTopConstraint.priority = .defaultLow
        
        
        let captionBottomConstraint = captionLabel.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: margins.bottomAnchor, multiplier: 1)
        captionBottomConstraint.priority = .defaultLow
        

        NSLayoutConstraint.activate([
//            sunView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//            sunView.topAnchor.constraint(equalTo: margins.topAnchor),
//            snowView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
//            snowView.topAnchor.constraint(equalTo: margins.topAnchor),
            
            captionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            captionLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            captionLabel.topAnchor.constraint(equalTo: margins.topAnchor),
//            captionLabel.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: margins.bottomAnchor, multiplier: 1),
            
            captionBottomConstraint,
            
            ///
//            captionLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: sunView.bottomAnchor, multiplier: 1.0),
//            captionLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: snowView.bottomAnchor, multiplier: 1.0),
            
//            captionTopConstraint
        ])
        
    }
    
    
}


private extension UIImageView {
    convenience init(named name: String, backgroundColor: UIColor) {
        self.init(image: UIImage(named: name))
        self.backgroundColor = backgroundColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
