//
//  SignUpController+UITextField.swift
//  Store Depot
//
//  Created by Jonathan Dowdell on 11/7/19.
//  Copyright © 2019 Jonathan Dowdell. All rights reserved.
//

import UIKit

extension SignUpController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.shiftVStack(tranform: CGAffineTransform(translationX: 0, y: -100))
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.shiftVStack(tranform: .identity)
        }
    }
    
}
