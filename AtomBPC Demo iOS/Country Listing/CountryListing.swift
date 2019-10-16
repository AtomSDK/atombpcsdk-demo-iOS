//
//  ServerListingViewModel.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore

class CountryListing {
    
    var countriesModel = [AtomCountry]()
    let atomProtocolObj = AtomProtocol()
    let atomPackageObj = AtomPackages()

    func getCountries(protocolSlug : String) {
        
        atomProtocolObj.protocol = protocolSlug
        
        HelperMethods().appDelegate.bpcManager?.getCountriesByProtocol(protocol: atomProtocolObj, response: { (allCountries, atomException) in
            self.countriesModel.removeAll()
            
            if let model = allCountries {
                self.countriesModel = model
                self.countriesModel = self.countriesModel.sorted(by: { (Obj1, Obj2) -> Bool in
                    let Obj1_Name = Obj1.name ?? ""
                    let Obj2_Name = Obj2.name ?? ""
                    return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                })
            }
            BaseViewModel.selectedCountrySlug.value = self.countriesModel.first?.country ?? ""
            BaseViewModel.selectedCountryName.value = self.countriesModel.first?.name ?? "No Country Found"
        })
    }
    
    func getCountries(packageId : String , protocolSlug : String)  {
        
        atomProtocolObj.protocol = protocolSlug
        atomPackageObj.packageId = packageId
        
        HelperMethods().appDelegate.bpcManager?.getCountriesByPackageAndProtocol(package: atomPackageObj, protocol: atomProtocolObj, response: { (countriesModel, atomException) in
            self.countriesModel.removeAll()
            
            if let model = countriesModel {
                self.countriesModel = model
                self.countriesModel = self.countriesModel.sorted(by: { (Obj1, Obj2) -> Bool in
                    let Obj1_Name = Obj1.name ?? ""
                    let Obj2_Name = Obj2.name ?? ""
                    return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                })
            }
            BaseViewModel.selectedCountrySlug.value = self.countriesModel.first?.country ?? ""
            BaseViewModel.selectedCountryName.value = self.countriesModel.first?.name ?? "No Country Found"
        })
    }
}
