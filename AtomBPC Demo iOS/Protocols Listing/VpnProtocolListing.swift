//
//  ServerListingViewModel.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore

class VpnProtocolListing {
    
    var protocolModel = [AtomProtocol]()
    var selectedProtocolModel :AtomProtocol? = nil
    
    func getProtocols() {
        
        HelperMethods().appDelegate.bpcManager?.getProtocols(response: { (allProtocols, atomExceptions) in
            self.protocolModel.removeAll()
            if let model = allProtocols {
                self.protocolModel = model
                self.protocolModel = self.protocolModel.sorted(by: { (Obj1, Obj2) -> Bool in
                    let Obj1_Name = Obj1.protocol ?? ""
                    let Obj2_Name = Obj2.protocol ?? ""
                    return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                })
            }
            BaseViewModel.selectedProtocolSlug.value = self.protocolModel.last?.protocol ?? "No Protocol Found"
        })
    }
    
    func getProtocols(packageId : String)  {
        let packageObj = AtomPackages()
        packageObj.packageId = packageId
        HelperMethods().appDelegate.bpcManager?.getProtocolsByPackage(package: packageObj, response: { (packageProtocols, atomException) in
            self.protocolModel.removeAll()
            if let model = packageProtocols {
                self.protocolModel = model
                self.protocolModel = self.protocolModel.sorted(by: { (Obj1, Obj2) -> Bool in
                    let Obj1_Name = Obj1.protocol ?? ""
                    let Obj2_Name = Obj2.protocol ?? ""
                    return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                })
            }
             BaseViewModel.selectedProtocolSlug.value = self.protocolModel.first?.protocol ?? "No Protocol Found"
        })
    }
}
