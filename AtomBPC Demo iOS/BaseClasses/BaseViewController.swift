//
//  BaseViewController.swift
//  WLA_iOS
//
//  Created by Muhammad kumail on 20/03/2019.
//  Copyright © 2019 Muhammad kumail. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        HelperMethods().appDelegate.registerDependencies()
    }
}
