//
//  RootViewController.swift
//  ScrollView-v2My
//
//  Created by Usman Fayyaz on 10/06/2024.
//

import UIKit

class RootViewController: UIViewController {

    private let activityView: ActivityView = {
        let view = ActivityView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var scrollView: AdaptiveScrollView = {
        let scrollView = AdaptiveScrollView()
        scrollView.addSubview(activityView)
        scrollView.addSubview(infoButton)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var infoButton: UIButton = {
        let button = UIButton(type: .infoDark)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showInfo(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Activity"
        view.backgroundColor = .yellow
        view.tintColor = .black
        
        setupView()
        
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: activityView.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: activityView.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: activityView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: activityView.bottomAnchor),
            
            scrollView.widthAnchor.constraint(equalTo: activityView.widthAnchor),
            
            infoButton.topAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.topAnchor),
            infoButton.leadingAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.leadingAnchor),
        ])
    }
    
    @objc func showInfo(_ sender: UIButton) {
        
    }


}



class AdaptiveScrollView: UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardDidShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo, let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardSize = frame.cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        adjustedContentInset(contentInsets)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        adjustedContentInset(.zero)
    }
    
    private func adjustedContentInset(_ contentInsets: UIEdgeInsets) {
        contentInset = contentInsets
        scrollIndicatorInsets = contentInset
    }
}
