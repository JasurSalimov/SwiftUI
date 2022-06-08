//
//  InterfaceController.swift
//  WatchApp WatchKit Extension
//
//  Created by Jasur Salimov on 6/7/22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        WKInterfaceController.reloadRootPageControllers(withNames: ["VideoController"], contexts: [""], orientation: .horizontal, pageIndex: 0)
        
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
