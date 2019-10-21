//
//  PackageListing.swift
//  iOSApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore
import AtomBPC
class PackageListing {
    
    var packagesModel = [AtomPackages]()
    
    func getPackages()  {
        
         AtomBPCManager.sharedInstance()?.getPackages(response: { (allpackages, atomException) in
            self.packagesModel.removeAll()
            if let model = allpackages {
                self.packagesModel = model
                self.packagesModel = self.packagesModel.sorted(by: { (Obj1, Obj2) -> Bool in
                    let Obj1_Name = Obj1.name ?? ""
                    let Obj2_Name = Obj2.name ?? ""
                    return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                })
            }
        })
    }
}
