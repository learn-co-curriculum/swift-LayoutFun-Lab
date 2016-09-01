//
//  ViewController.swift
//  LayoutFun
//
//  Created by James Campagno on 8/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView(frame: CGRectZero)
    let orangeView = UIView(frame: CGRectZero)
    let yellowView = UIView(frame: CGRectZero)
    let greenView = UIView(frame: CGRectZero)
    let blueView = UIView(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grayColor()
        turnOffAutoResizingOnAllViews()
        setupTheConstraints()
        setupColors()
    }
    
}

// MARK: Constraints
extension ViewController {
    
    func setupTheConstraints() {
        
        
        // TODO: Create all the constraints (in code) for the various views
        redView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.5).active = true
        redView.heightAnchor.constraintEqualToAnchor(self.redView.widthAnchor, multiplier: 1).active = true
        redView.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
        redView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        
        let array = [redView, orangeView, yellowView, greenView, blueView]
        
        for i in 1 ..< array.count {
            let view: UIView? = array[i]
            let previousView: UIView? = array[i-1]
            
            if let view = view, previousView = previousView {
                self.setupConstrainsForView(view, previousView: previousView)
            }
        }
        
        
        self.view.layoutIfNeeded()
        
    }
    
    func setupConstrainsForView(view:UIView, previousView:UIView) {
        view.widthAnchor.constraintEqualToAnchor(previousView.widthAnchor, multiplier: 0.75).active = true
        view.heightAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 1).active = true
        view.bottomAnchor.constraintEqualToAnchor(previousView.topAnchor).active = true
        view.centerXAnchor.constraintEqualToAnchor(previousView.centerXAnchor).active = true
    }
    
    func turnOffAutoResizingOnAllViews() {
        [redView, orangeView, yellowView, greenView, blueView].forEach { colorView in
            colorView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(colorView)
        }
    }
    
}


// MARK: Setting up Views
extension ViewController {
    
    func setupColors() {
        redView.backgroundColor = UIColor.redColor()
        orangeView.backgroundColor = UIColor.orangeColor()
        yellowView.backgroundColor = UIColor.yellowColor()
        greenView.backgroundColor = UIColor.greenColor()
        blueView.backgroundColor = UIColor.blueColor()
    }
}