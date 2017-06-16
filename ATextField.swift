//
//  ATextField.swift
//
//  Created by Arek on 19.11.2016.
//

import UIKit
import Cartography

class ATextField: UIView {
    
    var imageView: UIImageView!;
    fileprivate var border: UIView!;
    var textField: UITextField!;
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        setup();
        layoutView();
        style();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private extension ATextField{
    func setup(){
        
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0));
        self.textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0));
        self.border = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0));
        
        self.addSubview(imageView);
        self.addSubview(textField);
        self.addSubview(border);
    }
    func layoutView(){
        constrain(imageView){view in
            view.left == view.superview!.left;
            view.width == view.superview!.height;
            view.height == view.superview!.height;
            view.centerY == view.superview!.centerY;
        }
        
        constrain(textField, imageView){view, view2 in
            view.height == view.superview!.height * (2/3);
            view.right == view.superview!.right - 10;
            view.left == view2.right;
            view.centerY == view.superview!.centerY;
            
        }
        constrain(border, textField){view, view2 in
            view.top == view2.bottom - 5;
            view.right == view.superview!.right;
            view.left == view.superview!.left;
            view.height == 1;
            view.width == view.superview!.width;
        }
    }
    func style(){
        self.imageView.image = UIImage(named: "ic_person_white_36pt");
        self.imageView.contentMode = .center;
        self.textField.placeholder = "Username";
        self.textField.autocapitalizationType = UITextAutocapitalizationType.none;
        self.border.backgroundColor = UIColor.red;
    }
    
    
}
extension ATextField{
    func setImage(_ name: String){
        self.imageView.image = UIImage(named: name);
    }
    func setPlaceholder(_ text: String){
        self.textField.placeholder = text;
    }
    func setPlaceholder(_ text: String, font: String){
        let attributes = [
            NSForegroundColorAttributeName: UIColor.black,
            NSFontAttributeName : UIFont(name: font, size: 17)!
        ]
        self.textField.attributedPlaceholder = NSAttributedString(string: text, attributes:attributes)
    }
    func setPlaceholder(_ text:String,font: String, size: CGFloat){
        let attributes = [
            NSForegroundColorAttributeName: UIColor.black,
            NSFontAttributeName : UIFont(name: font, size: size)!
        ]
        self.textField.attributedPlaceholder = NSAttributedString(string: text, attributes:attributes)
        
    }
    func setPlaceholder(_ text:String,font: String, size: CGFloat, color: UIColor){
        let attributes = [
            NSForegroundColorAttributeName: color,
            NSFontAttributeName : UIFont(name: font, size: size)!
        ]
        self.textField.attributedPlaceholder = NSAttributedString(string: text, attributes:attributes)
        
    }
    func setFont(_ font: String, size: CGFloat){
        textField.font = UIFont(name: font, size: size);
    }
    func setFont(_ font: String, size: CGFloat, color: UIColor){
        textField.font = UIFont(name: font, size: size);
        textField.textColor = color;
    }
    func setBorderColor(_ color: UIColor){
        self.border.backgroundColor = color;
    }
}

