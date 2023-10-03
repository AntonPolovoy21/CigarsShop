//
//  ViewController.swift
//  MY CIGARS
//
//  Created by Admin on 21.09.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelEarnings: UILabel!
    
    @IBOutlet weak var labelSoldCount: UILabel!
    
    @IBOutlet var cigarsLeftArray: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func startNewDay(_ sender: UIButton) {
        CigarsShopManager.shared.earnings = 0
        CigarsShopManager.shared.soldCount = 0
        CigarsShopManager.shared.Cigars.indices.forEach() { index in
            CigarsShopManager.shared.Cigars[index].amountLeft = CigarsShopManager.shared.Cigars[index].inititalAmountLeft
        }
        
        showAlert(alertTitle: "New day at shop!!!", alertMessage: "Now there is more of our stuff")
        redrawView()
    }
    
    @IBAction func actionBuy(_ sender: UIButton) {
        let tagInfo = (sender.tag / 3, sender.tag % 3)
        let amountToBuy = tagInfo.1 == 0 ? 1 : tagInfo.1 * 5
        
        let isSuccsesfull = CigarsShopManager.shared.buyAmountOfCigars(cigarIndex: tagInfo.0, amountToBuy: amountToBuy)
        
        guard isSuccsesfull else { return }
        
        let cost = amountToBuy * CigarsShopManager.shared.Cigars[tagInfo.0].cost
        let name = CigarsShopManager.shared.Cigars[tagInfo.0].name
        showAlert(alertTitle: "You've made a purchase", alertMessage: "You've bought \(amountToBuy)x\"\(name)\" for \(cost)$")
        redrawView(withTag: tagInfo.0)
    }
    
    private func redrawView(withTag tag: Int) {
        labelEarnings.text = "Money earned today: \(CigarsShopManager.shared.earnings)$"
        labelSoldCount.text = "Sold cigars today: \(CigarsShopManager.shared.soldCount)"
        cigarsLeftArray[tag].text = "Cigars left: \(CigarsShopManager.shared.Cigars[tag].amountLeft)"
    }
    
    private func redrawView() {
        labelEarnings.text = "Money earned today: \(CigarsShopManager.shared.earnings)$"
        labelSoldCount.text = "Sold cigars today: \(CigarsShopManager.shared.soldCount)"
        
        for index in 0..<cigarsLeftArray.count {
            cigarsLeftArray[index].text = "Cigars left: \(CigarsShopManager.shared.Cigars[index].amountLeft)"
        }
    }
    
    func showAlert(alertTitle title: String, alertMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

