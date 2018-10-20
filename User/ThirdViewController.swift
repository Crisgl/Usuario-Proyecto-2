//
//  ThirdViewController.swift
//  User
//
//  Created by Cristian Lopez on 19/10/18.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var LabelPassword: UILabel!
    @IBOutlet weak var LabelUser: UILabel!
    @IBOutlet weak var TextUser: UITextField!
    @IBOutlet weak var TextPassword: UITextField!
    var txtUser : String = ""
    var txtPassword : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelUser.text = "Nombre de Usuario"
        LabelPassword.text = "Contraseña"
        let defaults = UserDefaults.standard
        if let dato = defaults.object(forKey: "dato") as? String{
            TextUser.text = dato
        }
        if let dato1 = defaults.object(forKey: "dato") as? String{ 
            TextPassword.text = dato1
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func Start(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        if let valor = TextUser.text{
            defaults.set(valor, forKey: "dato")
        }
        if let valor1 = TextPassword.text{
            defaults.set(valor1, forKey: "dato")
        }
        
        txtUser = TextUser.text!
        txtPassword = TextPassword.text!
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "third"{
            let destination = segue.destination as? SecondViewController
            destination?.first = txtUser
            
        }
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "third" {
            if TextUser.text == ""{
                LabelUser.text = "Usuario no valido"
                LabelUser.textColor = UIColor.red
                return false
            }
            if TextPassword.text == ""{
                LabelPassword.text = "Contraseña invalida"
                LabelPassword.textColor = UIColor.red
                return false
            }
            let z=UserF.count
            var n=0
            var x=n
            if z>0{
                for n in 0 ... z-1{
                    if txtUser == UserF[n]{
                        x=n
                        break
                    }
                    if n==z-1{
                        LabelUser.text = "Usuario no valido"
                        LabelUser.textColor = UIColor.red
                        return false
                    }
                }
    
                if txtPassword == PassF[x]{
                    return true
                }
                else{
                    LabelPassword.text = "Contraseña incorrecta"
                    LabelPassword.textColor = UIColor.red
                    LabelUser.text = "Usuario"
                    LabelUser.textColor = UIColor.black
                    return false
                }
            }
        }
         return true
    }
    

    
}


