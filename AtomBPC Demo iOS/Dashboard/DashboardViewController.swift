//
//  DashboardViewController.swift
//  AtomBPC Demo iOS
//
//  Created by Muhammad kumail on 14/10/2019.
//  Copyright © 2019 Atom By Secure. All rights reserved.
//

import UIKit
import AtomCore
import AtomBPC

class DashboardViewController: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var btnCountry: UIButton!
    @IBOutlet weak var btnProtocol: UIButton!
    @IBOutlet weak var btnPackage: UIButton!
    @IBOutlet weak var txtViewLogs: UITextView!
    @IBOutlet weak var btnConnect: UIButton!
    
    // MARK: - Variables
    var dashboardViewModel :DashboardViewModel!
    var protocolListing : VpnProtocolListing!
    var countryListing : CountryListing!
    var packageListing : PackageListing!
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resolveDependencies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
        getProtocols() // get all protocols
        getPackages() // get all packages
    }

    // MARK: - Resolve Dependencies
    func resolveDependencies() {
        
        dashboardViewModel = HelperMethods().referenceContainer.resolve(DashboardViewModel.self)
        protocolListing = HelperMethods().referenceContainer.resolve(VpnProtocolListing.self)
        countryListing = HelperMethods().referenceContainer.resolve(CountryListing.self)
        packageListing = HelperMethods().referenceContainer.resolve(PackageListing.self)
    }
    
    // MARK: - Update UI
    func updateUI(){
        
        setupUIViews()
        
        self.dashboardViewModel.vpnBtnTitle.bind { (buttonTitle) in
            self.btnConnect.setTitle(buttonTitle, for: UIControl.State.normal)
        }
        BaseViewModel.selectedPackageName.bind { (selectedPackage) in
            self.btnPackage.setTitle(selectedPackage, for: UIControl.State.normal)
        }
        
        BaseViewModel.selectedProtocolSlug.bind { (selectedProtocol) in
            self.btnProtocol.setTitle(selectedProtocol, for: UIControl.State.normal)
            self.getCountries() // get countries w.r.t selected protocol
        }
        BaseViewModel.selectedCountryName.bind { (selectedCountry) in
            self.btnCountry.setTitle(selectedCountry, for: UIControl.State.normal)
        }
        dashboardViewModel.ip.bind{(ipaddress) in
            print(ipaddress)
        }
        dashboardViewModel.vpnStatusLoging.bind { (vpnStatus) in
            self.txtViewLogs.text.append(vpnStatus + "\n")
        }
    }
    
    func setupUIViews(){
        txtViewLogs.layer.borderColor =  UIColor.gray.cgColor
        txtViewLogs.layer.borderWidth = 1.0
        btnPackage.layer.cornerRadius = 5.0
        btnProtocol.layer.cornerRadius = 5.0
        btnCountry.layer.cornerRadius = 5.0
        btnConnect.layer.cornerRadius = 5.0
    }
    
    
    // MARK: - Show Packages
    
    @IBAction func btnSelectPackage(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Select Package", message: "List of Packages", preferredStyle: .actionSheet)
        
        for singlePackage in self.packageListing.packagesModel{
            let superbutton = UIAlertAction(title: singlePackage.name , style: .default, handler: { (action) in
                BaseViewModel.selectedPackageName.value = singlePackage.name ?? ""
                BaseViewModel.selectedPackageId.value = singlePackage.packageId
                self.getProtocols() // get protocols w.r.t selected package
            })
            alertController.addAction(superbutton)
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Show Protocols
    
    @IBAction func selectProtocol(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Select Protocol", message: "List of Protocol", preferredStyle: .actionSheet)
        
        for singleProtocol in self.protocolListing.protocolModel{
            let superbutton = UIAlertAction(title: singleProtocol.protocol , style: .default, handler: { (action) in
               BaseViewModel.selectedProtocolSlug.value = singleProtocol.protocol ?? ""
            })
            alertController.addAction(superbutton)
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Show Countries
    
    @IBAction func btnSelectCountry(_ sender: Any) {
        let alertController = UIAlertController(title: "Select Country", message: "List of Countries", preferredStyle: .actionSheet)
        
        for singleCountry in self.countryListing.countriesModel{
            let superbutton = UIAlertAction(title: singleCountry.name , style: .default, handler: { (action) in
                BaseViewModel.selectedCountryName.value = singleCountry.name ?? ""
                BaseViewModel.selectedCountrySlug.value = singleCountry.country ?? ""
            })
            alertController.addAction(superbutton)
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
            action in
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Connect To VPN
    
    @IBAction func btnConnectToVpn(_ sender: UIButton) {
      
        if(BaseViewModel.vpnCurrentStatus == Constants.currentVpnStatus.vpnConnected){
            self.dashboardViewModel.disconnectVPN()
        }
        else if(BaseViewModel.vpnCurrentStatus == Constants.currentVpnStatus.vpnConnecting){
            self.dashboardViewModel.cancelVPN()
        }
        else {
            self.txtViewLogs.text = ""
            self.dashboardViewModel.connectVpn()
        }
    }
    
    
    // MARK: - Get Protocols From Inventory
    
    func getProtocols(){
        
        if BaseViewModel.selectedPackageId.value != "" {
            protocolListing.getProtocols(packageId: BaseViewModel.selectedPackageId.value)
        }else{
            protocolListing.getProtocols()
        }
    }
    
    // MARK: - Get Countries From Inventory
    
    func getCountries(){
        
        if BaseViewModel.selectedPackageId.value != "" {
            countryListing.getCountries(packageId: BaseViewModel.selectedPackageId.value, protocolSlug: BaseViewModel.selectedProtocolSlug.value)
        }
        else{
            countryListing.getCountries(protocolSlug: BaseViewModel.selectedProtocolSlug.value)
        }
    }
    
    // MARK: - Get Packages From Inventory
    
    func getPackages() {
       packageListing.getPackages()
    }
}
