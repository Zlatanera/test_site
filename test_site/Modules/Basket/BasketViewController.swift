//
//  BasketViewController.swift
//  test_site
//
//  Created by User on 18.03.2021.
//

import UIKit

class BasketViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = BasketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         
     }
    
    @IBAction func deleteBasket(_ sender: UIBarButtonItem) {
        //tableView.isEditing = !tableView.isEditing
        }
}

extension BasketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! UITableViewCell
        
        if indexPath.row == viewModel.getCount() {
            cell.textLabel?.text = "Сумма: \(viewModel.getSum())"
            
        } else {
            let product: Products.Item = viewModel.getProduct(by: indexPath.row)
            
            cell.textLabel?.text = product.name + " " + "\(product.price)"
            cell.detailTextLabel?.text = product.description
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let product: Products.Item = viewModel.getProduct(by: indexPath.row)
            //product.remove(at: indexPath.row) ???
            tableView.deleteRows(at: [indexPath], with: .left)
            //tableView.reloadData()
        }
        
    }
    
   

    
}
