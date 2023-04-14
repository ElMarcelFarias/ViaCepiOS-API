//
//  ViewController.swift
//  ViaCepiOS
//
//  Created by Marcel Leite de Farias on 13/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueCep: UITextField!
    @IBOutlet weak var textCep: UILabel!
    @IBOutlet weak var textLogradouro: UILabel!
    @IBOutlet weak var textComplemento: UILabel!
    @IBOutlet weak var textBairro: UILabel!
    @IBOutlet weak var textCidade: UILabel!
    @IBOutlet weak var textUF: UILabel!
    @IBOutlet weak var textDDD: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func buscarCEP(_ sender: Any) {
        ApiViaCep.viaCepRequest(valueCep.text!) { (cep) in
            //caso não tenha o DispatchQueue.main.sync
            // acontece esse erro e a lentidão é imensa!
            //UILabel.text must be used from main thread only
            DispatchQueue.main.sync {
                self.textCep.text = "CEP: \(cep.cep)"
                self.textLogradouro.text = "Logradouro: \(cep.logradouro)"
                self.textComplemento.text = "Complemento: \(cep.complemento)"
                self.textBairro.text = "Bairro: \(cep.bairro)"
                self.textCidade.text = "Cidade: \(cep.localidade)"
                self.textUF.text = "UF: \(cep.uf)"
                self.textDDD.text = "DDD: \(cep.ddd)"
            }
        }
    }
    

}



