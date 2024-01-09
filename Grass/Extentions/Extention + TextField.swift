import Foundation
import UIKit

// Personal TextField

final class CustomTextField: UITextField {
    
    
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    
    private func setupTextField(placeholder: String) {
        textColor = .black
        
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 184/255.0, green: 190/255.0, blue: 191/255.0, alpha: 1.000).cgColor
        layer.cornerRadius = 14
        
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 184/255.0, green: 190/255.0, blue: 191/255.0, alpha: 1.000)]
        )
    
    }
}
