//
//  BaseViewController.swift
//  WLA_iOS
//
//  Created by AtomBPC By Secure on 20/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        HelperMethods().appDelegate.registerDependencies()
    }
}
