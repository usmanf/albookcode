//
//  Challenge7_3VC.swift
//  Priorities-v2My
//
//  Created by Usman Fayyaz on 10/06/2024.
//

import UIKit

/// https://github.com/usmanf/albookcode/blob/main/solutions/layout-priorities/Code/Challenge7-3/Challenge7-3/ViewController.swift

class Challenge7_3VC: UIViewController {

    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupView()
    }
    
    
    private func setupView() {
        view.addSubview(greenView)
        
        let optionalHeightConstraint = greenView.heightAnchor.constraint(equalTo: view.heightAnchor)
        optionalHeightConstraint.priority = .defaultHigh
        
        let optionalWidthConstraint = greenView.widthAnchor.constraint(equalTo: view.widthAnchor)
        optionalWidthConstraint.priority = .defaultHigh

        NSLayoutConstraint.activate([
            // Aspect ratio 1:1 - makes the background view square
            greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor),
            
            // center the background view in the root view
            greenView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // width and height can grow up to the size of the root view
            greenView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
            greenView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor),
            
            // Pull the width as close as possible to the width
            // of the root view (without violating other required constraints)
            optionalWidthConstraint,
            
//            optionalHeightConstraint,
        ])
    }
}
