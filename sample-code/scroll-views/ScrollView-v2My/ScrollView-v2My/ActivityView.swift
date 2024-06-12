//  Copyright © 2018 Keith Harrison. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright
//  notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright
//  notice, this list of conditions and the following disclaimer in the
//  documentation and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its
//  contributors may be used to endorse or promote products derived from
//  this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.

import UIKit

final class ActivityView: UIStackView {
    private enum ViewMetrics {
        static let labelFontSize: CGFloat = 56.0
        static let buttonFontSize: CGFloat = 32.0
        static let buttonInset: CGFloat = 10.0
    }

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: ViewMetrics.labelFontSize)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = NSLocalizedString("Get Ready!", comment: "")
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Skater"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        let title = NSLocalizedString("Start", comment: "")
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ViewMetrics.buttonFontSize)
        button.contentEdgeInsets = UIEdgeInsets(top: ViewMetrics.buttonInset, left: 0.0, bottom: ViewMetrics.buttonInset, right: 0.0)
        return button
    }()
    
    private let textField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.placeholder = "Tap to bring up keyboard and test scroll view"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        axis = .vertical
        isLayoutMarginsRelativeArrangement = true
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        addArrangedSubview(label)
        addArrangedSubview(imageView)
//        addSubview(button)
        addArrangedSubview(textField)

        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
//            label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
//            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
//
//            imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
//            imageView.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1.0),
//            imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),

//            button.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
//            button.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1.0),
//            button.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
//            button.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)

//            textField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
//            textField.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 1.0),
//            textField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
//            textField.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
            ])
    }
}
