//
//  RegisterScreenViewControllerExtension.swift
//  Shift-Lab-Test
//
//  Created by admin on 29.04.2023.
//

import UIKit

// MARK: - Keyboard notification handler
extension RegisterScreenViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        self.scrollView.snp.remakeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(-(keyboardFrame.size.height + 20))
            make.width.equalToSuperview()
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        self.scrollView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}


// MARK: - UserInfoStackDelegate
extension RegisterScreenViewController: UserInfoStackDelegate {
    func nameTextFieldDidChange(_ text: String) {
        self.viewModel.updateName(with: text)
        self.turnOnRegisterButton()
    }
    func surnameTextFieldDidChange(_ text: String) {
        self.viewModel.updateSurname(with: text)
        self.turnOnRegisterButton()
    }
    func dateOfBirthTextFieldDidChange(_ text: String) {
        self.viewModel.updateDateOfBirth(with: text)
        self.turnOnRegisterButton()
    }
    func dateOfBirthDatePickerDidChange(_ text: String) {
        self.viewModel.updateDateOfBirth(with: text)
        self.turnOnRegisterButton()
    }
    func passwordTextFieldDidChange(_ text: String) {
        self.viewModel.updatePassword(with: text)
        self.turnOnRegisterButton()
    }
    func confirmPasswordTextFieldDidChange(_ text: String) {
        self.viewModel.updateConfirmPassword(with: text)
        self.turnOnRegisterButton()
    }
}
