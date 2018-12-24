//
//  OverlayViewController.swift
//  SwiftToolkit
//
//  Created by Avery Pierce on 12/21/18.
//  Copyright © 2018 Avery Pierce. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {

    private(set) public var backgroundContainerViewController = ContainerViewController()
    private(set) public var overlayPanelContainerViewController = ContainerViewController()
    
    private var scrollViewController : ScrollViewController!
    private var stackViewController : StackViewController!
    private var spacerViewController : ContainerViewController!
    
    override func loadView() {
        view = UIView()
        
        setupBackgroundContainerViewController()
        setupOverlayViewController()
    }
    
    private func setupBackgroundContainerViewController() {
        addChild(backgroundContainerViewController)
        view.addSubview(backgroundContainerViewController.view)
        backgroundContainerViewController.didMove(toParent: self)
    }
    
    private func setupOverlayViewController() {
        setupSpacerViewController()
        setupStackViewController()
        setupScrollViewController()
        
        addChild(scrollViewController)
        view.addSubview(scrollViewController.view)
        scrollViewController.didMove(toParent: self)
    }
    
    private func setupSpacerViewController() {
        spacerViewController = ContainerViewController()
        spacerViewController.backgroundColor = .clear
    }
    
    private func setupStackViewController() {
        stackViewController = StackViewController()
        let _ = stackViewController.view
        stackViewController.stackView.axis = .vertical
        stackViewController.append(spacerViewController)
        stackViewController.append(overlayPanelContainerViewController)
    }
    
    private func setupScrollViewController() {
        scrollViewController = ScrollViewController()
        scrollViewController.contentContainerViewController.setContent(stackViewController)
        scrollViewController.constrainsContentToFitWidth = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}