//
//  HelperButton.swift
//  Store Depot
//
//  Created by Jonathan Dowdell on 11/6/19.
//  Copyright © 2019 Jonathan Dowdell. All rights reserved.
//

import UIKit

class HelperButton: UIButton {
    
    private let buttonText:UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.textAlignment = .center
        lb.isUserInteractionEnabled = false
        lb.numberOfLines = 0
        return lb
    }()
    
    private let buttonImage:UIImageView = {
        let btn = UIImageView()
        btn.tintColor = .white
        btn.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 24).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 24).isActive = true
        btn.isUserInteractionEnabled = false
        return btn
    }()
    
    private let hStack:UIStackView = {
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.isUserInteractionEnabled = false
        return hStack
    }()
    
    
    required init(text: String, btnImage:UIImage? = nil, background:UIColor) {
        super.init(frame: .zero)
        // Baics
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 48).isActive = true
        buttonText.text = text
        self.backgroundColor = background
        self.layer.cornerRadius = 6
        // Stack
        hStack.addArrangedSubview(buttonText)
        self.addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            hStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            hStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        if btnImage != nil {
            buttonImage.image = btnImage?.withRenderingMode(.alwaysTemplate)
            buttonText.textAlignment = .left
            hStack.addArrangedSubview(buttonImage)
        }
    }
    
    
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        buttonText.text = title
    }
    
    override func setTitleColor(_ color: UIColor?, for state: UIControl.State) {
        buttonText.textColor = color
    }
    
    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        buttonImage.image = image
    }
    
    func setImageColor(_ color:UIColor?) {
        buttonImage.tintColor = color
    }
    
    override func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State) {
        buttonText.attributedText = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.buttonText.alpha = 0.5
            self.buttonImage.alpha = 0.5
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.buttonText.alpha = 1
            self.buttonImage.alpha = 1
        }
    }
}
