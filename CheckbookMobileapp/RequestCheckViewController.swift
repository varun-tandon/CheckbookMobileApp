//
//  RequestCheckViewController.swift
//  CheckbookMobileapp
//
//  Created by Vikram Shirsat on 2/23/19.
//  Copyright © 2019 Varun Tandon. All rights reserved.
//

import UIKit

class RequestCheckViewController: UIViewController {

    @IBOutlet weak var payeeNameInput: UITextField!
    @IBOutlet weak var payerEmailInput: UITextField!
    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    @IBAction func actionOnClick(_ sender: Any) {
//        requestCheck(payeeNameInput.text!, payerEmailInput.text!, amountInput.text!, descriptionInput.text!)
//    }
//
//    func requestCheck(_ payeeName: String, _ payeeEmail: String, _ amount: String, _ amount: String) {
//
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
