//
//  prototypeview.swift
//  TrabalhoIOSYanFelipePedroCunha
//
//  Created by COTEMIG on 30/09/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit
struct Produto {
    let imagem: String
    let nomePRODUTO: String
    let precoPRODUTO: String
    let descPRODUTO: String
}



class prototypeview: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    let ListaProduto: [Produto] = [
    Produto (imagem: "aaaa", nomePRODUTO: "Camiseta Keep", precoPRODUTO: "R$89,90", descPRODUTO: ""),
         Produto (imagem: "bbb", nomePRODUTO: "Camiseta I HATE", precoPRODUTO: "R$89,90", descPRODUTO: ""),
         Produto (imagem: "OIP", nomePRODUTO: "Funko POP Charada", precoPRODUTO: "R$159,90", descPRODUTO: ""),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let viewController = segue.destination as! Prod
       let PRODUTO = sender as! Produto
        viewController.nome = PRODUTO.nomePRODUTO
        viewController.imagem = UIImage(named: PRODUTO.imagem)
        viewController.preco = PRODUTO.precoPRODUTO
    }
}




extension prototypeview: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListaProduto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProdutoCell
        cell.nomePROD.text = ListaProduto[indexPath.row].nomePRODUTO
       
        cell.precoPROD.text = ListaProduto[indexPath.row].precoPRODUTO
        cell.imagemProduto.image = UIImage(named: ListaProduto[indexPath.row].imagem)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let produto = ListaProduto[indexPath.row]
        performSegue(withIdentifier:"Segue", sender: produto)
    }
    
}
