//
//  Prod.swift
//  TrabalhoIOSYanFelipePedroCunha
//
//  Created by COTEMIG on 30/09/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class Prod: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var nomeprod: UILabel!
    
   
    
    @IBOutlet weak var precoprod: UILabel!
    
    var imagem: UIImage?
    var nome:String?
    
    var preco: String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        imageview.image = imagem
        nomeprod.text = nome
        precoprod.text = preco
    }
    
    @IBAction func botaocompra(_ sender: Any) {
      
        let alerta = UIAlertController(title: "Compra do Item", message: "Parabens voce acabou de comprar este item", preferredStyle: UIAlertController.Style.alert)
        
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alerta.addAction(ok)
        
        self.present(alerta,animated: true,completion: nil)
        
    }
    
}
