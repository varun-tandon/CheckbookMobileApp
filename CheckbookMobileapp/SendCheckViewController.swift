//
//  SendCheckViewController.swift
//  CheckbookMobileapp
//
//  Created by Vikram Shirsat on 2/23/19.
//  Copyright © 2019 Varun Tandon. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class SendCheckViewController: UIViewController {


    @IBOutlet weak var payerNameInput: UITextField!
    @IBOutlet weak var payerEmailInput: UITextField!
    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextField!
    
    
    
//    
//    @IBAction func sendCheck(_ sender: Any) {
//    }
//    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func touchUpInsideSendCheck(_ sender: Any) {
        sendCheck(payerNameInput.text!, payerEmailInput.text!, amountInput.text!, descriptionInput.text)
        payerNameInput.text = ""
        payerEmailInput.text = ""
        amountInput.text = ""
        descriptionInput.text = ""
        
    }
    
    func sendCheck(_ payeeName: String, _ payeeEmail: String, _ amount: String, _ description: String?) {
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer b2vssr6S6ymQD9akd46MzVPbHCvTAK",
            ]
        let parameters: Parameters = [
            "recipient": payeeEmail,
            "name": payeeName,
            "amount": Float(amount)!,
            "description": description ?? ""
            ]
        
        AF.request("https://sandbox.checkbook.io/v3/check/digital", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let result = response.result.value {
                print(result)
            }
            
        }

    }
}
