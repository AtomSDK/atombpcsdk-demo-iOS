//
//  HelperMethods.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure on 18/09/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import UIKit
class HelperMethods {
   
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let referenceContainer = (UIApplication.shared.delegate as! AppDelegate).dependencyContainer
    init() {
    }
    
    func CustomPerformSeguge(from :UIViewController ,destinationStoryBoard : String , destinationStoryBoardIdentifier : String ) {
        let storyBoard : UIStoryboard = UIStoryboard.init(name: destinationStoryBoard, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: destinationStoryBoardIdentifier)
        from.navigationController?.pushViewController(viewController, animated: true)
//        from.present(viewController, animated: true, completion: nil)
    }
}
