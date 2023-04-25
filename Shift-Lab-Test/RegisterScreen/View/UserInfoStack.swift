//
//  UserInfoStack.swift
//  Shift-Lab-Test
//
//  Created by admin on 23.04.2023.
//

import UIKit

protocol UserInfoStackDelegate: AnyObject {
    func nameTextFieldDidChange(_ text: String)
    func surnameTextFieldDidChange(_ text: String)
    func dateOfBirthTextFieldDidChange(_ text: String)
    func dateOfBirthDatePickerDidChange(_ text: String)
    func passwordTextFieldDidChange(_ text: String)
    func confirmPasswordTextFieldDidChange(_ text: String)
}

class UserInfoStack: UIStackView {

    var viewModel: RegisterScreenViewModel
    weak var delegate: UserInfoStackDelegate?
    
    init(viewModel: RegisterScreenViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupSubviews()
        self.axis = .vertical
        self.spacing = 20
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addArrangedSubview(nameSection)
        self.addArrangedSubview(surnameSection)
        self.addArrangedSubview(dateOfBirthSection)
        self.addArrangedSubview(passwordSection)
        self.addArrangedSubview(confirmPasswordSection)
    }

    // MARK: - NameSection setup
    private lazy var nameSection: RegisterSectionView = {
        let mySection = RegisterSectionView(sectionName: R.string.registerScreenStrings.section_name(), currentText: self.viewModel.name, placeholderText: R.string.registerScreenStrings.section_name_placeholder(), isSecured: false)
        mySection.outlinedTextField.addTarget(self, action: #selector(nameTextFieldDidChange(_:)), for: .editingChanged)
        return mySection
    }()
    @objc private func nameTextFieldDidChange(_ textField: UITextField) {
        delegate?.nameTextFieldDidChange(nameSection.outlinedTextField.text ?? "")
    }
    
    // MARK: - SurnameSection setup
    private lazy var surnameSection: RegisterSectionView = {
        let mySection = RegisterSectionView(sectionName: R.string.registerScreenStrings.section_surname(), currentText: self.viewModel.surname, placeholderText: R.string.registerScreenStrings.section_surname_placeholder(), isSecured: false)
        mySection.outlinedTextField.addTarget(self, action: #selector(surnameTextFieldDidChange(_:)), for: .editingChanged)
        return mySection
    }()
    @objc private func surnameTextFieldDidChange(_ textField: UITextField) {
        delegate?.surnameTextFieldDidChange(surnameSection.outlinedTextField.text ?? "")
    }
    
    // MARK: - DateOfBirthSection setup
    private lazy var dateOfBirthSection: RegisterSectionView = {
        let mySection = RegisterSectionView(sectionName: R.string.registerScreenStrings.section_date_of_birth(), currentText: self.viewModel.dateOfBirth, placeholderText: R.string.registerScreenStrings.section_date_of_birth_placeholder(), isSecured: false, withDatePicker: true)
        mySection.datePickerTextField.addTarget(self, action: #selector(dateOfBirthTextFieldDidChange(_:)), for: .editingChanged)
        mySection.datePickerTextField.datePicker.addTarget(self, action: #selector(dateOfBirthDatePickerDidChange(_:)), for: .valueChanged)
        return mySection
    }()
    @objc private func dateOfBirthTextFieldDidChange(_ textField: UITextField) {
        delegate?.dateOfBirthTextFieldDidChange(dateOfBirthSection.datePickerTextField.text ?? "")
        dateOfBirthSection.datePickerTextField.text = self.viewModel.dateOfBirth
    }
    @objc private func dateOfBirthDatePickerDidChange(_ datePicker: UIDatePicker) {
        delegate?.dateOfBirthDatePickerDidChange(self.viewModel.convertDateToString(datePicker.date))
        dateOfBirthSection.datePickerTextField.text = self.viewModel.dateOfBirth
    }
    
    // MARK: - PasswordSection setup
    private lazy var passwordSection: RegisterSectionView = {
        let mySection = RegisterSectionView(sectionName: R.string.registerScreenStrings.section_password(), currentText: self.viewModel.password, placeholderText: R.string.registerScreenStrings.section_password_placeholder(), isSecured: true)
        mySection.outlinedTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        return mySection
    }()
    @objc private func passwordTextFieldDidChange(_ textField: UITextField) {
        delegate?.passwordTextFieldDidChange(passwordSection.outlinedTextField.text ?? "")
    }
    
    // MARK: - ConfirmPasswordSection setup
    private lazy var confirmPasswordSection: RegisterSectionView = {
        let mySection = RegisterSectionView(sectionName: R.string.registerScreenStrings.section_confirm_password(), currentText: self.viewModel.confirmPassword, placeholderText: R.string.registerScreenStrings.section_confirm_password_placeholder(), isSecured: true)
        mySection.outlinedTextField.addTarget(self, action: #selector(confirmPasswordTextFieldDidChange(_:)), for: .editingChanged)
        return mySection
    }()
    @objc private func confirmPasswordTextFieldDidChange(_ textField: UITextField) {
        delegate?.confirmPasswordTextFieldDidChange(confirmPasswordSection.outlinedTextField.text ?? "")
    }
    
}
