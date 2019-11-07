//
//  HelperTextField.swift
//  Store Depot
//
//  Created by Jonathan Dowdell on 11/6/19.
//  Copyright © 2019 Jonathan Dowdell. All rights reserved.
//

import UIKit

class HelperTextField: UIView {
    
    let hStack: UIStackView = {
        let hstack = UIStackView()
        hstack.translatesAutoresizingMaskIntoConstraints = false
        hstack.axis = .horizontal
        hstack.distribution = .fillProportionally
        return hstack
    }()
    
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Place Holder", attributes: [
            NSAttributedString.Key.foregroundColor : UIColor.gray79])
        tf.textColor = .gray99
        return tf
    }()
    
    
    required init(placeHolder: String, secure: Bool = false) {
        super.init(frame: .zero)
        setupUI(secure)
        textField.placeholder = placeHolder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(_ secure: Bool) {
        // Basic UI
        self.backgroundColor = .gray19
        self.layer.cornerRadius = 6
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 44).isActive = true
        // HStack
        self.addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            hStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            hStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            hStack.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        hStack.addArrangedSubview(textField)
        // Secure Button 
        if secure {
            let passwordBtn = UIButton(type: .system)
            passwordBtn.setImage(UIImage(named: "password-eye")?.withRenderingMode(.alwaysOriginal), for: .normal)
            passwordBtn.translatesAutoresizingMaskIntoConstraints = false
            passwordBtn.heightAnchor.constraint(equalToConstant: 44).isActive = true
            passwordBtn.widthAnchor.constraint(equalToConstant: 24).isActive = true
            hStack.addArrangedSubview(passwordBtn)
        }
    }
    
}
