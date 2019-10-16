//
//  CommonConstants.swift
//  WLA_POC
//
//  Created by AtomBPC By Secure on 11/03/2019.
//  Copyright © 2019 AtomBPC By Secure . All rights reserved.
//

import Foundation

public struct Constants {
    
    public struct customSegueIdentifiers{
        
        public static let dashboardViewSegue = "dashboardVC"
        public static let listingViewSegue = "listingSegue"
        public static let credentialSegue = "credentialsVC"
    }
    
    public struct vpnState {
 
        public static let connect = "Connect"
        public static let validating = "Validating"
        public static let generatingCredentiails = "GeneratingCredentials"
        public static let connecting = "Connecting"
        public static let connected = "Connected"
        public static let disconnecting = "Disconnecting"
        public static let disconnected = "Disconnected"
        public static let disconnect = "Disconnect"
        public static let gettingFastestServer = "GettingFastestServer"
        public static let reasserting = "Reasserting"
        public static let invalid = "Invalid"
        public static let authenticating = "Authenticating"
        public static let verifyingHostName = "VerifyingHostName"
        public static let optimizingConnection = "OptimizingConnection"
        
    }
    public struct currentVpnStatus{
        
        public static let vpnConnecting = "Connecting"
        public static let vpnDisconnected = "Disconnected"
        public static let vpnConnected = "Connected"
    }
}
