//
//  WelcomeController.swift
//  Store Depot
//
//  Created by Jonathan Dowdell on 11/6/19.
//  Copyright © 2019 Jonathan Dowdell. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome\nto Store Depot"
        label.textColor = .gray99Dynamic
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "A Leaner, Meaner Online Store."
        label.textColor = .gray99Dynamic
        return label
    }()
    
    private let companyLogo: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Logo"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return iv
    }()
    
    private let topLabelsStackV: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 15
        return sv
    }()
    
    private let inputStackViewV: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 15
        return sv
    }()
    
    private let email = HelperTextField(placeHolder: "Email")
    private let password = HelperTextField(placeHolder: "Password", secure: true)
    private let loginBtn = HelperButton(text: "Login", background: .baseColor)
    private let forgotBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(.baseColor, for: .normal)
        btn.setTitle("Forgot password?", for: .normal)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    private let signUpBtn:HelperButton = {
        let sb = HelperButton(text: "Sign Up", btnImage: UIImage(named: "right-arrow"), background: .gray19)
        sb.setTitleColor(.gray99, for: .normal)
        sb.setImageColor(UIColor.gray79)
        return sb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        // Basic UI
        view.backgroundColor = .whiteDynamic
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // Top Stack
        topLabelsStackV.addArrangedSubiews([welcomeLabel,subLabel])
        view.addSubview(topLabelsStackV)
        NSLayoutConstraint.activate([
            topLabelsStackV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            topLabelsStackV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        ])
        // Logo
        view.addSubview(companyLogo)
        NSLayoutConstraint.activate([
            companyLogo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            companyLogo.topAnchor.constraint(equalTo: topLabelsStackV.topAnchor)
        ])
        // Input
        inputStackViewV.addArrangedSubiews([email, password, loginBtn, forgotBtn])
        inputStackViewV.setCustomSpacing(20, after: password)
        loginBtn.addTarget(self, action: #selector(didClick), for: .touchUpInside)
        view.addSubview(inputStackViewV)
        NSLayoutConstraint.activate([
            inputStackViewV.leadingAnchor.constraint(equalTo: topLabelsStackV.leadingAnchor, constant: 0),
            inputStackViewV.trailingAnchor.constraint(equalTo: companyLogo.trailingAnchor, constant: 0),
            inputStackViewV.topAnchor.constraint(equalTo: topLabelsStackV.bottomAnchor, constant: 75)
        ])
        // Sign Up
        signUpBtn.addTarget(self, action: #selector(launchSignUp), for: .touchUpInside)
        view.addSubview(signUpBtn)
        NSLayoutConstraint.activate([
            signUpBtn.leadingAnchor.constraint(equalTo: topLabelsStackV.leadingAnchor),
            signUpBtn.trailingAnchor.constraint(equalTo: companyLogo.trailingAnchor),
            signUpBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    @objc func didClick() {
        print("Hello World")
    }
    
    @objc func launchSignUp() {
        self.navigationController?.pushViewController(SignUpController(), animated: true)
    }
}

