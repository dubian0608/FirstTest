//
//  MainViewController.swift
//  FirstTest
//
//  Created by Zhang Ji on 2020/4/16.
//  Copyright © 2020 Zhang Ji. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var roomIdTextField: UITextField!
    @IBOutlet weak var uidTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier else { return }
        switch segueId {
        case "mainToRoom":
            guard let roomId = self.roomIdTextField.text else {
                return
            }
            
            guard let uid = self.uidTextField.text else {
                return
            }
            
            let roomVC = segue.destination as! RoomViewController
            roomVC.roomId = roomId
            roomVC.uid = uid
        default:
            break
        }
    }
    
    @IBAction func doJoinPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "mainToRoom", sender: nil)
    }
}
