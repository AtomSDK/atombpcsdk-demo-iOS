//
//  MainViewController.swift
//  AtomBPC Demo iOS
//
//  Created by AtomBPC By Secure on 14/10/2019.
//  Copyright © 2019 Atom By Secure. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
  
    // MARK: - IBOutlet
    @IBOutlet weak var txtFieldSecretKey: UITextField!
    
    // MARK: - Variables
    
    var mainViewModel :MainViewModel!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        resolveDependencies()
    }

    override func viewWillAppear(_ animated: Bool) {
       updateUI()
    }

    // MARK: - Resolve Dependencies
    
    private func resolveDependencies() {
        
        mainViewModel = HelperMethods().referenceContainer.resolve(MainViewModel.self)
    }
    
    // MARK: - Update UI
    
    func updateUI() {
        mainViewModel.atomValidationStatus.bind { (status) in
            HelperMethods().CustomPerformSeguge(from: self, destinationStoryBoard: "Credentials", destinationStoryBoardIdentifier: Constants.customSegueIdentifiers.credentialSegue)
        }

        mainViewModel.atomValidationMessage.bind { (message) in
            print(message as Any)
        }
    }
    
    // MARK: - Initialise SDK
    
    @IBAction func btnInitialise(_ sender: Any) {
       
        guard let secrectKey = self.txtFieldSecretKey.text else {return}
        BaseViewModel.secretKey.value = secrectKey
        self.mainViewModel.validateAtomWithSecretKey(secretKey: secrectKey)
    }
}

