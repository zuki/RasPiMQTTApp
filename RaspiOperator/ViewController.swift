//
//  ViewController.swift
//  RaspiOperator
//
//  Created by Keiji Suzuki on 2019/06/26.
//  Copyright © 2019 Keiji Suzuki. All rights reserved.
//

import UIKit
import CocoaMQTT

class ViewController: UIViewController {
      let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "192.168.11.12", port: 1883)
    @IBOutlet weak var connBtn: UIButton!
    @IBOutlet weak var disconnBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.connBtn.setTitleColor(UIColor.darkText, for: .normal)
        self.disconnBtn.setTitleColor(UIColor.darkText, for: .normal)
    }

    @IBAction func gpio40SW(_ sender: UISwitch) {
        // If switch is ON, publish to topi "rpi/gpio" with message "on", else publish message "off"
        if sender.isOn {
            mqttClient.publish("rpi/gpio", withString: "on")
        } else {
            mqttClient.publish("rpi/gpio", withString: "off")
        }
    }


    @IBAction func connectButton(_ sender: UIButton) {
        sender.setTitleColor(UIColor.red, for: .normal)
        self.disconnBtn.setTitleColor(UIColor.darkText, for: .normal)
        _ = mqttClient.connect()
    }

    
    @IBAction func diconnectButton(_ sender: UIButton) {
        sender.setTitleColor(UIColor.red, for: .normal)
        self.connBtn.setTitleColor(UIColor.darkText, for: .normal)
        mqttClient.disconnect()
    }
}

