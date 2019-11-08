//
//  SignUpController.swift
//  Store Depot
//
//  Created by Jonathan Dowdell on 11/7/19.
//  Copyright © 2019 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    
    private let vStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 10
        return sv
    }()
    
    private let loginFaceBook: HelperButton =  {
        let hb = HelperButton(text: "Log In with Facebook", btnImage: UIImage(named: "facebook"), background: UIColor.gray19)
        hb.setImageColor(.gray79)
        hb.setTitleColor(.gray99, for: .normal)
        return hb
    }()
    
    private let firstName = HelperTextField(placeHolder: "First Name")
    private let lastName = HelperTextField(placeHolder: "Last Name")
    private let email = HelperTextField(placeHolder: "Email")
    private let password = HelperTextField(placeHolder: "Password")
    private let passwordConfirm = HelperTextField(placeHolder: "Password Confirm")
    private let continueBtn = HelperButton(text: "Continue", background: .baseColor)
    private let termsAndPrivacy: HelperButton = {
        let btn = HelperButton(text: "", background: .whiteDynamic)
        let baseColor = [NSAttributedString.Key.foregroundColor : UIColor.baseColor,
        NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
        let normalColor = [NSAttributedString.Key.foregroundColor : UIColor.gray79,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]
        var atti = NSMutableAttributedString(string: "By signing up, you agree to our\n", attributes: normalColor)
        atti.append(NSAttributedString(string: "Terms", attributes: baseColor))
        atti.append(NSAttributedString(string: " and ", attributes: normalColor))
        atti.append(NSAttributedString(string: "Privacy", attributes: baseColor))
        btn.setAttributedTitle(atti, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navbar()
        setupDelegate()
    }
    
    private func setupUI() {
        // Basic
        view.backgroundColor = .whiteDynamic
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
        // SubText
        let subText = UILabel()
        subText.text = "or sign up with Email"
        subText.font = .systemFont(ofSize: 14)
        subText.textAlignment = .center
        subText.textColor = .gray79
        // Main VStack
        vStack.addArrangedSubiews([loginFaceBook,subText,firstName,lastName,email,password,passwordConfirm,continueBtn,termsAndPrivacy])
        vStack.setCustomSpacing(12, [loginFaceBook,subText])
        vStack.setCustomSpacing(20, [passwordConfirm,continueBtn])
        view.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
        ])
    }
    
    func shiftVStack(tranform:CGAffineTransform) {
        vStack.transform = tranform
    }
    
    private func setupDelegate() {
        password.textField.delegate = self
        passwordConfirm.textField.delegate = self
    }
    
    private func navbar() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.image = UIImage(named: "Logo20px")
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
}
