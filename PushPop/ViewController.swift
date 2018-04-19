//
//  ViewController.swift
//  PushPop
//
//  Created by PresentingViewController on 17/04/18.
//  Copyright © 2018 Srijan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.view.backgroundColor = UIColor.yellow
        
        let button = UIButton(frame: CGRect(x: 40, y: 100, width: 140, height: 40))
        button.setTitle("Show Popover", for: .normal)
        button.addTarget(self, action: #selector(self.clickButton), for: .touchUpInside)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
        
    }
    
    // Delegate Function To Ensure Adaption Of Presenting View Controller
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    // Click Button Method
    @objc private func clickButton(sender: UIButton){
        
        let presentingViewController = PresentingViewController()
        let navigationController = UINavigationController(rootViewController: presentingViewController)
        navigationController.modalPresentationStyle = .popover
        let popOver = navigationController.popoverPresentationController!
        popOver.sourceRect = sender.bounds
        popOver.delegate = self
        popOver.permittedArrowDirections = .up
        popOver.sourceView = sender
        self.present(navigationController, animated: true, completion: nil)

    }


}
