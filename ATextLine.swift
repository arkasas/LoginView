//
//  ATextLine.swift
//
//  Created by Arek on 21.11.2016.
//

import UIKit
import Cartography

class ATextLine: UIView {
    
    fileprivate var leftLine: UIView!
    fileprivate var rightLine: UIView!
    fileprivate var label: UILabel!
    fileprivate var textString: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setup();
        layoutView();
        style();
        
    }
    
    init(frame: CGRect, tText: String) {
        super.init(frame: frame);
        
        textString = tText
        setup();
        layoutView();
        style();
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextString(_ tText: String){
        self.textString = tText
    }
    
}
private extension ATextLine{
    func setup(){
        leftLine = UIView();
        rightLine = UIView();
        label = UILabel();
        
        self.addSubview(leftLine);
        self.addSubview(rightLine);
        self.addSubview(label);
    }
    func layoutView(){
        
        
        label.sizeToFit();
        label.adjustsFontSizeToFitWidth = true
        
        
        
        constrain(label){view in
            view.height == view.superview!.height;
            view.centerX == view.superview!.centerX;
            view.centerY == view.superview!.centerY-2;
        }
        
        
        constrain(leftLine, label){view, view2 in
            view.height == 1;
            view.right == view2.left - 15;
            view.left == view.superview!.left;
            view.centerY == view.superview!.centerY;
        }
        constrain(rightLine, label){view, view2 in
            view.height == 1;
            view.left == view2.right + 15;
            view.right == view.superview!.right;
            view.centerY == view.superview!.centerY;
        }
        print(label.frame);
        
        
    }
    func style(){
        leftLine.backgroundColor = UIColor.red;
        rightLine.backgroundColor = UIColor.red;
        label.textColor = UIColor.white;
        label.textAlignment = .center;
        label.font = UIFont(name: "Avenir-Light", size: 15.0);
        label.text = textString ?? "Or sign in with:"
    }
    
    
}
