//
//  INGBaseViewController.swift
//  Account Test
//
//  Created by Ricardo Casanova on 21/2/16.
//  Copyright © 2016 Marvel. All rights reserved.
//

//__ This is the base view controller class
//__ Ypu can add any global method to this class in order to use it by any viewcontroller in the app
class INGBaseViewController: UIViewController {
    //__ Show alert
    internal func showAlertWith(message: String, title: String) {
        //__ Create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        //__ Add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        //__ Show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
