//
//  ArduinoPeripheral.swift
//  Gait Monitor
//
//  Created by Harrison Szczapa on 2/6/20.
//  Copyright © 2020 Harrison Szczapa. All rights reserved.
//

import UIKit
import CoreBluetooth

class ArduinoPeripheral: NSObject {
    public static let ArduinoServiceUUID = CBUUID(string: "E3541844-8E04-D71C-8B89-C414C73C32E3")
    public static let ArduinoCharUUID = CBUUID(string: "FFE0")
}

