//
//  RegisterSectionView.swift
//  Shift-Lab-Test
//
//  Created by admin on 22.04.2023.
//

import UIKit
import SnapKit

class RegisterSectionView: UIView {

    var sectionName: String
    var currentText: String
    var placeholderText: String
    var isSecured: Bool
    var withDatePicker: Bool
    
    init(sectionName: String, currentText: String, placeholderText: String, isSecured: Bool, withDatePicker: Bool = false) {
        self.sectionName = sectionName
        self.currentText = currentText
        self.placeholderText = placeholderText
        self.isSecured = isSecured
        self.withDatePicker = withDatePicker
        super.init(frame: .zero)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        setupSectionNameLabel()
        if self.withDatePicker {
            setupDatePickerTextField()
        }
        else {
            setupOutlinedTextField()
        }
    }
    
    // MARK: - SectionNameLabel setup
    private lazy var sectionNameLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.text = self.sectionName
        myLabel.numberOfLines = 0
        myLabel.font = R.font.poppinsMedium(size: 13)
        myLabel.textColor = R.color.charcoal()
        return myLabel
    }()
    private func setupSectionNameLabel() {
        addSubview(sectionNameLabel)
        sectionNameLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
    }
    
    // MARK: - OutlinedTextField setup
    lazy var outlinedTextField: OutlinedTextField = {
        let myTextField = OutlinedTextField(currentText: self.currentText, placeholderText: self.placeholderText, isSecured: self.isSecured)
        return myTextField
    }()
    private func setupOutlinedTextField() {
        addSubview(outlinedTextField)
        outlinedTextField.snp.makeConstraints { make in
            make.top.equalTo(sectionNameLabel.snp.bottom).offset(6)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - DatePickerTextField setup
    lazy var datePickerTextField: DatePickerTextField = {
        let myDatePicker = DatePickerTextField(currentText: self.currentText, placeholderText: self.placeholderText)
        return myDatePicker
    }()
    private func setupDatePickerTextField() {
        addSubview(datePickerTextField)
        datePickerTextField.snp.makeConstraints { make in
            make.top.equalTo(sectionNameLabel.snp.bottom).offset(6)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
