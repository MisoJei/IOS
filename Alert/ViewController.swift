//
//  ViewController.swift
//  Alert
//
//  Created by gng on 10/23/23.
//

import UIKit
    
class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    var isLampOn = true
    
    let lampImg = UIImageView()
    let btnLampOn = UIButton()
    let btnLampOff = UIButton()
    let btnLampRemove = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // UIImageView Init
        self.view.addSubview(lampImg)
        lampImg.translatesAutoresizingMaskIntoConstraints = false
        lampImg.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        lampImg.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        lampImg.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive = true
        lampImg.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -120).isActive = true
        lampImg.image = imgOn
        
        // UIButton Init
        self.view.addSubview(btnLampOn)
        btnLampOn.translatesAutoresizingMaskIntoConstraints = false
        btnLampOn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        btnLampOn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        btnLampOn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btnLampOn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnLampOn.setTitle("켜기", for: .normal)
        btnLampOn.setTitleColor(.black, for: .normal)
        btnLampOn.addTarget(self, action: #selector(self.BtnLampOn(sender:)), for: .touchUpInside)
        
        self.view.addSubview(btnLampOff)
        btnLampOff.translatesAutoresizingMaskIntoConstraints = false
        btnLampOff.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        btnLampOff.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        btnLampOff.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btnLampOff.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnLampOff.setTitle("끄기", for: .normal)
        btnLampOff.setTitleColor(.black, for: .normal)
        btnLampOff.addTarget(self, action: #selector(self.BtnLampOff(sender:)), for: .touchUpInside)
        
        self.view.addSubview(btnLampRemove)
        btnLampRemove.translatesAutoresizingMaskIntoConstraints = false
        btnLampRemove.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        btnLampRemove.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        btnLampRemove.widthAnchor.constraint(equalToConstant: 80).isActive = true
        btnLampRemove.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnLampRemove.setTitle("제거", for: .normal)
        btnLampRemove.setTitleColor(.black, for: .normal)
        btnLampRemove.addTarget(self, action: #selector(self.BtnLampRemove(sender:)), for: .touchUpInside)
    }
    
    @objc func BtnLampOn(sender: UIButton!) {
        if isLampOn {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style:.default, handler: nil)
            
            lampOnAlert.addAction(onAction)
            
            present(lampOnAlert, animated: true, completion: nil)
        }
        else {
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @objc func BtnLampOff(sender: UIButton!) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {
                // 익명 함수, 클로저
                // 컴파일러가 반환타입, 매개변수의 타입을 알 수 있는 경우 생략 가능
                ACTION in
                self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }

    @objc func BtnLampRemove(sender: UIButton!) {
        let lampRemoveAlert = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

