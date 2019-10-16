//
//  AppDelegate.swift
//  AtomBPC Demo iOS
//
//  Created by AtomBPC By Secure on 14/10/2019.
//  Copyright © 2019 Atom By Secure. All rights reserved.
//

import UIKit
import AtomBPC
import Swinject
import SwinjectAutoregistration

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let dependencyContainer = Container()
    var bpcManager : AtomBPCManager? = nil
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func registerDependencies(){
        viewModelDependencies()
    }
    
    func viewModelDependencies(){
        
        dependencyContainer.autoregister(AtomValidation.self, initializer: AtomValidation.init)
        dependencyContainer.autoregister(MainViewModel.self, initializer: MainViewModel.init)
        dependencyContainer.autoregister(CredentialsViewModel.self, initializer: CredentialsViewModel.init)
        dependencyContainer.autoregister(DashboardViewModel.self, initializer: DashboardViewModel.init)
        dependencyContainer.autoregister(VpnProtocolListing.self, initializer: VpnProtocolListing.init).inObjectScope(.container)
        dependencyContainer.autoregister(CountryListing.self, initializer: CountryListing.init).inObjectScope(.container)
        dependencyContainer.autoregister(PackageListing.self, initializer: PackageListing.init).inObjectScope(.container)
    }
}

