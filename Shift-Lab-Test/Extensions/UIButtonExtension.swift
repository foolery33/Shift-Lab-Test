//
//  UIButtonExtension.swift
//  Shift-Lab-Test
//
//  Created by admin on 29.04.2023.
//

import UIKit

extension UIButton {
    func addImagePressedEffect() {
        // Добавляем обработчик нажатия на кнопку
        addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchDown)
    }

    @objc private func buttonPressed(sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            sender.titleLabel?.alpha = 0.5 // уменьшаем прозрачность
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                sender.titleLabel?.alpha = 1 // увеличиваем прозрачность
            })
        })
    }
}
