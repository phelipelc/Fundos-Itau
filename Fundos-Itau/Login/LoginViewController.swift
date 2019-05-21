//
//  ViewController.swift
//  Fundos-Itau
//
//  Created by Phelipe Campos on 20/05/19.
//  Copyright © 2019 Lopes. All rights reserved.
//

import UIKit
import GeneralFormatter
class LoginViewController: UIViewController, PresenterToViewProtocol {
    
    var presenter: ViewToPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var fields = [Fields]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        LoginRouter.createModule(view: self)
        presenter?.didLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func addFields(_ fields: [Fields]){
        self.fields = fields
        tableView.reloadData()
    }
    
    func showLoading() {
       loading.startAnimating()
    }
    func hideLoading(){
       loading.stopAnimating()
    }
    func showError() {
        
    }
    func addField(field: Fields) -> UIView{
        var fieldV: UIView?
        switch field.type {
            case 1:
                let tf = UITextField(frame: CGRect(x: 20, y: (field.topSpacing! + 20.0) - 20 , width: 300, height: 20))
                tf.placeholder = field.message
                fieldV = tf
                tf.delegate = self
            case 2:
                let tf = UILabel(frame: CGRect(x: 20, y: (field.topSpacing! + 20.0) - 20 , width: 300, height: 20))
                tf.numberOfLines = 0
                tf.text = field.message
                fieldV = tf
            case 4:
               
                let tf = UILabel(frame: CGRect(x: 20, y: (field.topSpacing! + 20.0) - 20 , width: 250, height: 20))
                let sw = UISwitch(frame: CGRect(x: 20, y: (field.topSpacing! + 20.0) - 20 , width: 300, height: 20))
                sw.isOn = true
                tf.text = field.message
                let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: tf.frame.height + sw.frame.height + CGFloat(field.topSpacing!)))
                
                view.addSubview(tf)
                view.addSubview(sw)
                
                sw.translatesAutoresizingMaskIntoConstraints = false
                sw.leadingAnchor.constraint(equalTo: tf.trailingAnchor).isActive = true
                sw.bottomAnchor.constraint(equalTo: tf.bottomAnchor).isActive = true
                
                fieldV = view
            default:
                let tf = UIButton(frame: CGRect(x: 20, y: (field.topSpacing! + 20.0) - 20 , width: 300, height: 20))
                tf.backgroundColor = UIColor.blue
                tf.setTitle(field.message, for: .normal)
                fieldV = tf
            
        }
       
        return fieldV!
    }
    
}

extension LoginViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return CGFloat(fields[indexPath.row].topSpacing! + 20)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
    
        let field = self.fields[indexPath.row]
    
        cell!.addSubview(addField(field: field))
        return cell!
        
    }
    
    
}

extension LoginViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return GeneralFormatter.phone.formatTextField(_: textField, shouldChangeCharactersIn: range, replacementString: string)
    }
}




