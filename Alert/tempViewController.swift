//
//  tempViewController.swift
//  Alert
//
//  Created by gng on 12/13/23.
//

import UIKit

class tempViewController: UIViewController {

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
    
    func add(a: Int, b: Int) -> Int {
        return a+b
    }
    
    func sub(a: Int, b: Int) -> Int {
        return a-b
    }
    
    func mul(a: Int, b: Int) -> Int {
        return a*b
    }
    
    func div(a: Int, b: Int) -> Int {
        return a/b
    }
}
