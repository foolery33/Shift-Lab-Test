//
//  FilledButton.swift
//  Shift-Lab-Test
//
//  Created by admin on 25.04.2023.
//

import UIKit

class FilledButton: UIButton {

    var label: String
    var backColor: UIColor
    var textColor: UIColor
    
    init(label: String, backColor: UIColor, textColor: UIColor) {
        self.label = label
        self.backColor = backColor
        self.textColor = textColor
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.2) {
                    self.titleLabel?.alpha = 0.5
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.titleLabel?.alpha = 1.0
                }
            }
        }
    }
    
    private func setupButton() {
        self.layer.backgroundColor = self.backColor.cgColor
        self.setTitle(label, for: .normal)
        self.contentEdgeInsets = UIEdgeInsets(top: Paddings.topContentPadding, left: Paddings.leadingContentPadding, bottom: Paddings.bottomContentPadding, right: Paddings.trailingContentPadding)
        self.titleLabel?.font = R.font.poppinsSemiBold(size: Scales.fontSize)
        self.setTitleColor(self.textColor, for: .normal)
        self.setTitleColor(self.textColor.withAlphaComponent(0.5), for: .disabled)
        self.layer.cornerRadius = Scales.cornerRadius
    }

    private enum Paddings {
        static let topContentPadding = 13.0
        static let bottomContentPadding = 13.0
        static let leadingContentPadding = 0.0
        static let trailingContentPadding = 0.0
    }
    
    private enum Scales {
        static let fontSize = 14.0
        static let cornerRadius = 6.0
    }
    
}
