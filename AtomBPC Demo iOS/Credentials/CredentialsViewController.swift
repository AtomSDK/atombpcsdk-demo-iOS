//
//  CredentialsViewController.swift
//  AtomBPC Demo iOS
//
//  Created by AtomBPC By Secure on 14/10/2019.
//  Copyright © 2019 Atom By Secure. All rights reserved.
//

import UIKit

class CredentialsViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var txtFieldUUID: UITextField!
    @IBOutlet weak var txtFieldUsername: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldSecretKey: UITextField!
    
    // MARK: - Variables
    
    var credentialsViewModel : CredentialsViewModel!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resolveDependencies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    // MARK: - Resolve Dependencies
    
    private func resolveDependencies() {
        
        credentialsViewModel = HelperMethods().referenceContainer.resolve(CredentialsViewModel.self)
    }
    
    // MARK: - Update UI
    
    func updateUI(){
        self.txtFieldSecretKey.text = BaseViewModel.secretKey.value
        credentialsViewModel.message.bind { (message) in
            print(message)
        }
        credentialsViewModel.proceed.bind { (proceed) in
           HelperMethods().CustomPerformSeguge(from: self, destinationStoryBoard: "Dashboard", destinationStoryBoardIdentifier: Constants.customSegueIdentifiers.dashboardViewSegue)
        }
    }
    
    // MARK: - Validate Credentials
    
    @IBAction func btnProceed(_ sender: UIButton) {
        self.credentialsViewModel.validateInputParamas(uuid: self.txtFieldUUID , vpnUserName: self.txtFieldUsername, vpnPassword: self.txtFieldPassword)
    }
}
