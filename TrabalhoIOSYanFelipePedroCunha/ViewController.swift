//
//  ViewController.swift
//  TrabalhoIOSYanFelipePedroCunha
//
//  Created by COTEMIG on 23/09/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtsenha: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()        }

    @IBAction func btnentrar(_ sender: Any) {
 
        let user = txtemail.text ?? ""
        let password = txtsenha.text ?? ""
        if (user.isEmpty || password.isEmpty){
            let alertaDeErro = UIAlertController(title: "Campos", message: "No deixe campos vazios", preferredStyle: UIAlertController.Style.alert)
            alertaDeErro.addAction(UIAlertAction(title:"Ok",style: UIAlertAction.Style.cancel,handler: nil))
            self.present(alertaDeErro, animated: true)
        }else{

            let loginurl = URL(string: "https://trabalhoios-api.herokuapp.com/login/\(user)/\(password)")!
            let session = URLSession.shared
            session.dataTask(with: loginurl,completionHandler: {
                (data,response,Error) in
                DispatchQueue.main.async {
                let statusCode = response as? HTTPURLResponse
                print("\(statusCode?.statusCode ?? 0)")
                if(statusCode?.statusCode==200){
                    self.performSegue(withIdentifier: "mostrarprodutos", sender: self)
                }
                else {
                    let alertaDeErro = UIAlertController(title: "Login", message: "Usurio incorreto", preferredStyle: UIAlertController.Style.alert)
                    alertaDeErro.addAction(UIAlertAction(title:"Ok",style: UIAlertAction.Style.cancel,handler: nil))
                    self.present(alertaDeErro, animated: true)
                }
                }}).resume()
        }
    }
    
}

