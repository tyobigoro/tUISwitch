//
//  ViewController.swift
//  tUISwitch
//
//  Created by tyobigoro_i on 2020/01/05.
//  Copyright © 2020 tyobigoro_i. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tSwitch: UISwitch!
    
    var switchStatus: Bool = true {
        didSet {
            if oldValue != switchStatus {
                saveSwitchStatus()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readSwitchStatus()
    }
    
    @IBAction func switchDidTap(_ sender: UISwitch) {
        switchStatus = sender.isOn
    }
    
    @IBAction func transitionBtnDidTap(_ sender: Any) {
        performSegue(withIdentifier: "Goto2ndVC", sender: nil)
    }
    
    @IBAction func backFromSecondVC(segue: UIStoryboardSegue){
        print("backFrom2ndVC")
    }
    
    func saveSwitchStatus() {
        let ud = UserDefaults.standard
        ud.set(switchStatus, forKey: "switchStatus")
    }
    
    func readSwitchStatus() {
        let ud = UserDefaults.standard
        ud.register(defaults: ["switchStatus": true])
        switchStatus = ud.bool(forKey: "switchStatus")
        tSwitch.isOn = switchStatus
    }
    
}

class SeondVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushReturnBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
