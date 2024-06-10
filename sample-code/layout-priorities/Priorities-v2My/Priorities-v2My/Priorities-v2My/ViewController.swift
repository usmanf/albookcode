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


extension UILabel {
    
    convenience init(text: String, fontSize: CGFloat = 32, backgroundColor: UIColor = .white) {
        self.init()
        self.text = text
        font = UIFont.systemFont(ofSize: fontSize)
        numberOfLines = 0
        self.backgroundColor = backgroundColor
        translatesAutoresizingMaskIntoConstraints = false
    }

}


// MARK: - ViewController2
/// Challenge 7.1 Twice As Big If Possible

class ViewController2: UIViewController {
    
    let authorLabel = UILabel(text: "William Shakespeare", fontSize: 24, backgroundColor: .systemYellow)
    
    let quotationLabel = UILabel(text: "To be, or not to be, that is the question", fontSize: 24, backgroundColor: .systemPurple)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(authorLabel)
        view.addSubview(quotationLabel)
        

        let quotationWidthConstraint = quotationLabel.widthAnchor.constraint(equalTo: authorLabel.widthAnchor, multiplier: 2)
        quotationWidthConstraint.priority = .defaultHigh

        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            authorLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            authorLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            
            authorLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 160),

            quotationLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            quotationLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            
            quotationLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: authorLabel.trailingAnchor, multiplier: 1),
            
            quotationWidthConstraint,
        ])
    }
}
