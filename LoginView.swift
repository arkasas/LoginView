//
//  LoginView.swift
//
//  Created by Arek on 19.11.2016.
//

import UIKit
import Cartography

protocol LoginListener {
    func onLoginClick(_ username: String, password: String);
    func onCreateAccountClick();
    func onResetPasswordClick();
    func onFacebookLogin();
    func onTwitterLogin();
    func onLinkedlinLogin();
}

class LoginView: UIView {
    
    fileprivate var backgroundImage: UIImageView!;
    fileprivate var userNameField: ATextField!;
    fileprivate var passwordField: ATextField!;
    fileprivate var loginButton: UIButton!;
    fileprivate var createAccountLabel: UILabel!;
    fileprivate var textLine: ATextLine!
    fileprivate var socialLoginStack: UIStackView!;
    fileprivate var facebookButton: UIButton!;
    fileprivate var twitterButton: UIButton!;
    fileprivate var linkedlinButton: UIButton!;
    fileprivate var wrongPasswordLabel: UILabel!;
    fileprivate var linearBar: LinearProgressBar!;
    fileprivate var resetPasswordLabel: UILabel!;
    fileprivate var top: CGFloat = 0;
    
    internal var loginListner: LoginListener!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        setup();
        layoutView();
        style();
    }
    init(frame: CGRect, top: CGFloat){
        super.init(frame: frame);
        
        self.top = top;
        setup();
        layoutView();
        style();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
}
private extension LoginView{
    func setup(){
        backgroundImage = UIImageView();
        userNameField = ATextField();
        passwordField = ATextField();
        loginButton = UIButton();
        createAccountLabel = UILabel();
        resetPasswordLabel = UILabel();
        textLine = ATextLine();
        socialLoginStack = UIStackView();
        facebookButton = UIButton();
        linkedlinButton = UIButton();
        twitterButton = UIButton();
        wrongPasswordLabel = UILabel();
        linearBar = LinearProgressBar();
        
        socialLoginStack.addArrangedSubview(facebookButton);
        socialLoginStack.addArrangedSubview(linkedlinButton);
        socialLoginStack.addArrangedSubview(twitterButton);
        
        self.addSubview(backgroundImage);
        self.addSubview(userNameField);
        self.addSubview(passwordField)
        self.addSubview(loginButton);
        self.addSubview(createAccountLabel);
        self.addSubview(textLine);
        self.addSubview(socialLoginStack);
        self.addSubview(wrongPasswordLabel);
        self.addSubview(linearBar);
        self.addSubview(resetPasswordLabel);
    }
    func layoutView(){
        constrain(backgroundImage){view in
            view.width == view.superview!.width;
            view.height == view.superview!.height;
            view.top == view.superview!.top;
            view.left == view.superview!.left;
            view.right == view.superview!.right;
            view.bottom == view.superview!.bottom;
        }
        constrain(userNameField, block: {view in
            view.width == view.superview!.width - 30;
            view.height == 60;
            view.centerX == view.superview!.centerX;
            view.centerY == view.superview!.centerY - 100;
            view.left == view.superview!.left + 15;
            view.right == view.superview!.right - 15;
        });
        constrain(passwordField, block: {view in
            view.width == view.superview!.width - 30;
            view.height == 60;
            view.centerX == view.superview!.centerX;
            view.centerY == view.superview!.centerY - 50;
            view.left == view.superview!.left + 15;
            view.right == view.superview!.right - 15;
        });
        
        constrain(loginButton){view in
            view.width == view.superview!.width - 100;
            view.height == 44;
            view.centerX == view.superview!.centerX;
            view.centerY == view.superview!.centerY + 5;
        }
        constrain(wrongPasswordLabel, loginButton){view, view2 in
            view.width == view.superview!.width;
            view.height == 30;
            view.right == view.superview!.right;
            view.left == view.superview!.left;
            view.top == view2.bottom + 10;
        }
        constrain(createAccountLabel){view in
            view.width == view.superview!.width - 50;
            view.height == 50;
            view.centerX == view.superview!.centerX;
            view.bottom == view.superview!.bottom - 40;
        }
        constrain(resetPasswordLabel){view in
            view.width == view.superview!.width - 50;
            view.height == 50;
            view.centerX == view.superview!.centerX;
            view.bottom == view.superview!.bottom - 5;
        }
        
        
        constrain(textLine, wrongPasswordLabel){view, view2 in
            view.left == view.superview!.left + 15;
            view.right == view.superview!.right - 15;
            view.width == view.superview!.width - 30;
            view.height == 50;
            view.top == view2.bottom + 5;
        }
        constrain(socialLoginStack, textLine, createAccountLabel){view, view2, view3 in
            //            view.width == view.superview!.width - 100;
            //            view.height == 120;
            view.left == view.superview!.left + 50;
            view.right == view.superview!.right - 50;
            view.top == view2.bottom;
            view.bottom == view3.top;
        }
        constrain(facebookButton){view in
            view.top == view.superview!.top;
            view.bottom == view.superview!.bottom;
        }
        constrain(twitterButton){view in
            view.top == view.superview!.top;
            view.bottom == view.superview!.bottom;
        }
        constrain(linkedlinButton){view in
            view.top == view.superview!.top;
            view.bottom == view.superview!.bottom;
        }
        constrain(linearBar){view in
            view.left == view.superview!.left;
            view.right == view.superview!.right;
            view.top == view.superview!.top + top;
        }
    }
    func style(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginView.dismissKeyboard))
        self.addGestureRecognizer(tap)
        
        
        self.backgroundImage.image = UIImage(named: "splash");
        self.backgroundImage.setupBlur();
        
        self.userNameField.setImage("ic_person_outline_white");
        self.passwordField.setImage("ic_lock_outline_white");
        
        self.userNameField.setBorderColor(UIColor.gray);
        self.passwordField.setBorderColor(UIColor.gray);
        self.passwordField.textField.isSecureTextEntry = true;
        
        
        self.userNameField.setPlaceholder("Username", font: "Avenir-Light", size: 15.0, color: UIColor.white);
        self.passwordField.setPlaceholder("Password", font: "Avenir-Light", size: 15.0, color: UIColor.white);
        self.userNameField.setFont("Avenir-Light", size: 15.0, color: UIColor.white);
        self.passwordField.setFont("Avenir-Light", size: 15.0, color: UIColor.white);
        
        self.loginButton.backgroundColor = UIColor(red: 244.0/255.0, green: 67.0/255.0, blue: 54.0/255.0, alpha: 1.0);
        self.loginButton.setTitle("Login", for: UIControlState());
        self.loginButton.layer.cornerRadius = 22;
        self.loginButton.addTarget(self, action: #selector(LoginView.loginClick), for: .touchUpInside);
        self.loginButton.addTarget(self, action: #selector(LoginView.touchBeginLogin), for: .touchDown);
        
        
        
        self.createAccountLabel.text = "Don't have an account? Sign up";
        self.createAccountLabel.textColor = UIColor.white;
        self.createAccountLabel.font = UIFont(name: "Avenir-Light", size: 13);
        self.createAccountLabel.textAlignment = .center;
        let createAccountTap = UITapGestureRecognizer(target: self, action: #selector(LoginView.createAccountClick));
        self.createAccountLabel.isUserInteractionEnabled = true;
        self.createAccountLabel.addGestureRecognizer(createAccountTap);
        
        self.resetPasswordLabel.text = "Forgot password? Click here";
        self.resetPasswordLabel.textColor = UIColor.white;
        self.resetPasswordLabel.font = UIFont(name: "Avenir-Light", size: 13);
        self.resetPasswordLabel.textAlignment = .center;
        let resetPasswordTap = UITapGestureRecognizer(target: self, action: #selector(LoginView.resetPasswordClick));
        self.resetPasswordLabel.isUserInteractionEnabled = true;
        self.resetPasswordLabel.addGestureRecognizer(resetPasswordTap);
        
        self.backgroundColor = UIColor.cyan;
        
        self.facebookButton.imageView?.contentMode = .scaleAspectFit;
        self.facebookButton.contentVerticalAlignment = .fill;
        self.facebookButton.contentHorizontalAlignment = .fill;
        self.facebookButton.setImage(UIImage(named: "facebook"), for: UIControlState());
        
        
        self.twitterButton.imageView?.contentMode = .scaleAspectFit;
        self.twitterButton.contentVerticalAlignment = .fill;
        self.twitterButton.contentHorizontalAlignment = .fill;
        self.twitterButton.setImage(UIImage(named: "twitter"), for: UIControlState());
        
        self.linkedlinButton.imageView?.contentMode = .scaleAspectFit;
        self.linkedlinButton.contentVerticalAlignment = .fill;
        self.linkedlinButton.contentHorizontalAlignment = .fill;
        self.linkedlinButton.setImage(UIImage(named: "linkedlin"), for: UIControlState());
        
        self.facebookButton.addTarget(self, action: #selector(LoginView.facebookClick), for: .touchUpInside);
        self.twitterButton.addTarget(self, action: #selector(LoginView.twitterClick), for: .touchUpInside);
        self.linkedlinButton.addTarget(self, action: #selector(LoginView.linkedlinClick), for: .touchUpInside);
        
        self.socialLoginStack.axis = .horizontal;
        self.socialLoginStack.contentMode = .scaleToFill;
        self.socialLoginStack.distribution = .fillEqually;
        self.socialLoginStack.alignment = .center;
        self.socialLoginStack.spacing = 15.0;
        self.socialLoginStack.backgroundColor = UIColor.red;
        
        self.wrongPasswordLabel.textAlignment = .center;
        self.wrongPasswordLabel.font = UIFont(name: "Avenir-Light", size: 15);
        
        linearBar.backgroundProgressBarColor = UIColor(red:159.0/255.0, green:168.0/255.0, blue:218.0/255.0, alpha:1.0);
        linearBar.progressBarColor =  UIColor(red:81.0/255.0, green:45.0/255.0, blue:168.0/255.0, alpha:1.0);
        
        linearBar.heightForLinearBar = 3;
        
    }
}
extension LoginView{
    func loginClick(){
        self.loginButton.backgroundColor = UIColor(red: 244.0/255.0, green: 67.0/255.0, blue: 54.0/255.0, alpha: 1.0);
        
        if loginListner != nil {
            linearBar.startAnimation();
            loginListner.onLoginClick(userNameField.textField.text!, password: passwordField.textField.text!);
        }
    }
    func createAccountClick(){
        if loginListner != nil {
            loginListner.onCreateAccountClick();
        }
    }
    func resetPasswordClick(){
        if loginListner != nil {
            loginListner.onResetPasswordClick();
        }
    }
    func facebookClick(){
        if loginListner != nil {
            loginListner.onFacebookLogin();
        }
    }
    func twitterClick(){
        if loginListner != nil {
            loginListner.onTwitterLogin();
        }
    }
    func linkedlinClick(){
        if loginListner != nil {
            loginListner.onLinkedlinLogin();
        }
    }
    func dismissKeyboard() {
        self.endEditing(true)
    }
    
    func wrong(_ text: String, font: UIFont){
        self.linearBar.stopAnimation();
        self.wrongPasswordLabel.text = text;
        self.wrongPasswordLabel.font = font;
    }
    func wrong(_ text: String, font: UIFont, color: UIColor){
        self.linearBar.stopAnimation();
        self.wrongPasswordLabel.text = text;
        self.wrongPasswordLabel.font = font;
        self.wrongPasswordLabel.textColor = color;
    }
    func touchBeginLogin(){
        self.loginButton.backgroundColor = UIColor(red: 198.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0);
    }
    func touchEndLogin(){
        self.loginButton.backgroundColor = UIColor(red: 244.0/255.0, green: 67.0/255.0, blue: 54.0/255.0, alpha: 1.0);
    }
    
}
