//
//  ViewController.swift
//  User
//
//  Created by Cristian Lopez on 16/10/18.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var User1: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var Password1: UITextField!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var mail1: UILabel!
    @IBOutlet weak var mail: UITextField!
    var mail2 : String = ""
    var user2 : String = ""
    var pass : String = ""
    var data = [Data]()
    var a = 0
    var mailf = Mailf
    var userf = UserF
    var passf = PassF
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        mail1.text = "Correo"
        password.text = "Contraseña"
        user.text = "Nombre de Usuario"
        if let dato = defaults.object(forKey: "dato") as? String{
            mail.text = dato
        }
        if let dato1 = defaults.object(forKey: "dato") as? String{
            User1.text = dato1
        }
        if let dato2 = defaults.object(forKey: "dato") as? String{
            Password1.text = dato2
        }

        mail.text = ""
        User1.text = ""
        Password1.text = ""
 
    }
    
    @IBAction func Register(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        if let valor = mail.text{
            defaults.set(valor, forKey: "dato")
        }
        if let valor1 = User1.text{
            defaults.set(valor1, forKey: "dato")
        }
        if let valor2 = Password1.text{
            defaults.set(valor2, forKey: "dato")
        }
        
        if a==1{
            performSegue(withIdentifier: "second", sender: self)
        }
        
        
        
        
        mail2 = mail.text!
        user2 = User1.text!
        pass = Password1.text!
        print(type(of: mail2))

        data.append(Data(name: user2, mail: mail2, password: pass))
        print(PassF.count)

        
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "second"{
            let destination = segue.destination as? SecondViewController
            destination?.first = mail2
            
        }

    }

   override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "second" {
            var i = 0
            let z=Mailf.count
            var x=0
            print(z)
            if z>0 {
                for n in 0 ... z-1{
                    if mail2 == Mailf[n]{
                        i=i+1
                    }
                    if i==1{
                        x=0
                        mail1.text = "Correo ya en uso"
                        mail1.textColor = UIColor.red
                        return false
                    }
                    else{
                        x=1
                    }
                }
                i=0
                for n in 0 ... 0{
                    if user2 == UserF[n]{
                        i=i+1
                    }
                    if i==1 {
                        user.text = "Nombre de usuario ya en uso"
                        user.textColor = UIColor.red
                        return false
                    }
                }

            }
            if Password1.text == "" {
                
                password.text = "Contraseña no valida"
                password.textColor = UIColor.red
                user.text = "Nombre de Usuario"
                user.textColor = UIColor.black
                mail1.text = "Correo"
                mail1.textColor = UIColor.black
                
                return false
            }
            else if  User1.text == "" {
                user.text = "Usuario no valido"
                user.textColor = UIColor.red
                password.text = "Contraseña"
                password.textColor = UIColor.black
                mail1.text = "Correo"
                mail1.textColor = UIColor.black
                return false
            }
            else if mail.text == ""{
                mail1.text = "Correo no valido"
                mail1.textColor = UIColor.black
                password.text = "Contraseña"
                password.textColor = UIColor.black
                user.text = "Nombre de Usuario"
                user.textColor = UIColor.black
                return false
            }
                
            else {
                x=1
            }
            if x == 0{
                return false
            }
            else {
                PassF.append(pass)
                UserF.append(user2)
                Mailf.append(mail2)
                return true
            }

        }
        
        // by default, transition
        return true
    }

}

