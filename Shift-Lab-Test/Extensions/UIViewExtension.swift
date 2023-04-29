//
//  UIViewExtension.swift
//  Shift-Lab-Test
//
//  Created by admin on 29.04.2023.
//

import UIKit

extension UIView {
    
    // MARK: Keyboard dismiss
    func addKeyboardDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    @objc
    func dismissKeyboard() {
        self.endEditing(true)
    }
    
}
