//
//  DatePickerTextField.swift
//  Shift-Lab-Test
//
//  Created by admin on 23.04.2023.
//

import UIKit

class DatePickerTextField: UITextField {

    private enum Paddings {
        static let offset = 16.0
        static let textField = UIEdgeInsets(top: 13.0, left: 16.0, bottom: 13.0, right: 16.0)
    }
    
    private enum Scales {
        static let fontSize = 14.0
        static let borderWidth = 1.0
        static let cornerRadius = 4.0
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Paddings.textField)
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Paddings.textField)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Paddings.textField)
    }
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let offset = Paddings.offset
        let width  = Int(datePicker.bounds.width)
        let height = Int(self.bounds.height)
        let x = Int(Int(bounds.width) - width - Int(offset))
        let y = Int(self.bounds.minY)
        let rightViewBounds = CGRect(x: x, y: y, width: width, height: height)
        return rightViewBounds
    }
    
    let currentText: String
    let placeholderText: String
    
    init(currentText: String, placeholderText: String) {
        self.currentText = currentText
        self.placeholderText = placeholderText
        
        super.init(frame: .zero)
        
        self.text = currentText
        self.autocapitalizationType = .none
        self.textColor = R.color.charcoal()
        self.font = R.font.poppinsRegular(size: Scales.fontSize)
        self.attributedPlaceholder = NSAttributedString(string: self.placeholderText, attributes: [NSAttributedString.Key.foregroundColor: R.color.softGray()!])
        
        self.layer.borderColor = R.color.softGray()?.cgColor
        self.layer.borderWidth = Scales.borderWidth
        self.layer.cornerRadius = Scales.cornerRadius
        
        self.rightView = datePicker
        self.rightViewMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DatePicker setup
    lazy var datePicker: UIDatePicker = {
        let myDatePicker = UIDatePicker()
        myDatePicker.tintColor = R.color.charcoal()
        myDatePicker.datePickerMode = .date
        return myDatePicker
    }()
}
