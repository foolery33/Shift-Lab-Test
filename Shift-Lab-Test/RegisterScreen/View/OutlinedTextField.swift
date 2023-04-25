//
//  OutlinedTextField.swift
//  Shift-Lab-Test
//
//  Created by admin on 22.04.2023.
//

import UIKit
import SnapKit

class OutlinedTextField: UITextField {
    
    enum SystemImages {
        static let eyeSlash = "eye.slash"
        static let eye = "eye"
    }
    private enum Paddings {
        static let offset = 16.0
        static let securedTextField = UIEdgeInsets(top: 13.0, left: 16.0, bottom: 13.0, right: 48.0)
        static let textField = UIEdgeInsets(top: 13.0, left: 16.0, bottom: 13.0, right: 16.0)
    }
    
    private enum Scales {
        static let fontSize = 14.0
        static let borderWidth = 1.0
        static let cornerRadius = 4.0
        static let passwordEyeSize = 22.0
    }
    
    let currentText: String
    let placeholderText: String
    let isSecured: Bool
    
    init(currentText: String, placeholderText: String, isSecured: Bool) {
        self.currentText = currentText
        self.placeholderText = placeholderText
        self.isSecured = isSecured
        super.init(frame: .zero)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.isSecured ? Paddings.securedTextField : Paddings.textField)
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.isSecured ? Paddings.securedTextField : Paddings.textField)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.isSecured ? Paddings.securedTextField : Paddings.textField)
    }
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let offset = Paddings.offset
        let width  = Int(Scales.passwordEyeSize)
        let height = width
        let x = Int(Int(bounds.width) - Int(width) - Int(offset))
        let y = Int(self.bounds.height / 2 - Scales.passwordEyeSize / 2)
        let rightViewBounds = CGRect(x: x, y: y, width: width, height: height)
        return rightViewBounds
    }
    
    private func setupTextField() {
        
        self.text = currentText
        self.autocapitalizationType = .none
        self.textColor = R.color.charcoal()
        self.font = R.font.poppinsRegular(size: Scales.fontSize)
        self.isSecureTextEntry = self.isSecured
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholderText, attributes: [NSAttributedString.Key.foregroundColor: R.color.softGray()!])
        
        self.layer.borderColor = R.color.softGray()?.cgColor
        self.layer.borderWidth = Scales.borderWidth
        self.layer.cornerRadius = Scales.cornerRadius
        
        if(self.isSecured) {
            self.rightView = passwordEye
            self.rightViewMode = .always
            self.textContentType = .oneTimeCode
        }
        
    }
    
    // MARK: - PasswordEye setup
    private lazy var passwordEye: UIButton = {
        let eye = UIButton(type: .custom)
        eye.setImage(UIImage(systemName: SystemImages.eyeSlash)!.resizeImage(newWidth: Scales.passwordEyeSize, newHeight: Scales.passwordEyeSize).withTintColor(R.color.charcoal()!), for: .normal)
        eye.setImage(UIImage(systemName: SystemImages.eye)!.resizeImage(newWidth: Scales.passwordEyeSize, newHeight: Scales.passwordEyeSize).withTintColor(R.color.charcoal()!), for: .selected)
        eye.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return eye
    }()
    @objc
    func togglePasswordVisibility(_ sender: UIButton) {
        self.isSecureTextEntry.toggle()
        sender.isSelected = !sender.isSelected
    }
    
}

extension UIImage {
    func resizeImage(newWidth: CGFloat, newHeight: CGFloat) -> UIImage {
        let targetSize = CGSize(width: newWidth, height: newHeight)
        
        let widthScaleRatio = targetSize.width / self.size.width
        let heightScaleRatio = targetSize.height / self.size.height
        
        let scaleFactor = min(widthScaleRatio, heightScaleRatio)
        
        let scaledImageSize = CGSize(width: self.size.width * scaleFactor, height: self.size.height * scaleFactor)
        
        let renderer = UIGraphicsImageRenderer(size: scaledImageSize)
        
        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: scaledImageSize))
        }
        return scaledImage
    }
}
