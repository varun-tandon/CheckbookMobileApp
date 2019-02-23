//
//  RequestCheckViewController.swift
//  CheckbookMobileapp
//
//  Created by Vikram Shirsat on 2/23/19.
//  Copyright © 2019 Varun Tandon. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import SwiftyJSON

class RequestCheckViewController: UIViewController {

    @IBOutlet weak var payeeNameInput: UITextField!
    @IBOutlet weak var payeeEmailInput: UITextField!
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
        @IBAction func actionOnClick(_ sender: Any) {
            requestCheck(payeeNameInput.text!, payeeEmailInput.text!, amountInput.text!, descriptionInput.text)
            payeeNameInput.text = ""
            payeeEmailInput.text = ""
            amountInput.text = ""
            descriptionInput.text = ""
        }
    
        func requestCheck(_ payerName: String, _ payermail: String, _ amount: String, _ description: String?) {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer b2vssr6S6ymQD9akd46MzVPbHCvTAK",
                ]
            let parameters: Parameters = [
                "recipient": payermail,
                "name": payerName,
                "amount": Float(amount)!,
                "description": description ?? ""
            ]
            
            AF.request("https://sandbox.checkbook.io/v3/invoice", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                if let result = response.result.value {
                    print(result)
                }
                
            }
    
        }
}
