//
//  DashboardViewModel.swift
//  AtomBPC Demo iOS
//
//  Created by Muhammad kumail on 14/10/2019.
//  Copyright © 2019 Atom By Secure. All rights reserved.
//

import UIKit

class CredentialsViewModel: BaseViewModel {
    
    var proceed = Dynamic(Bool())
    var message = Dynamic(String())
    
    func validateInputParamas(uuid : UITextField? , vpnUserName : UITextField? , vpnPassword : UITextField?) {
        
        if(vpnUserName?.text != "" && vpnPassword?.text != ""){
            BaseViewModel.credential_vpnUserName.value = vpnUserName!.text!
            BaseViewModel.credential_vpnPassword.value = vpnPassword!.text!
            self.proceed.value = true
        }
        else if(uuid?.text != ""){
            BaseViewModel.credential_uuid.value = uuid!.text!
            self.proceed.value = true
        }
        else{
            self.message.value = "Please Provide Either vpn username and password or UUID "
        }
    }
}
