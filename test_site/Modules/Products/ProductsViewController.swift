//
//  ViewController.swift
//  test_site
//
//  Created by User on 18.03.2021.
//

import UIKit

class ProductsViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ProductsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func addToBasketRequest(_ indexPath: IndexPath) {
        let product = viewModel.getProduct(by: indexPath.row)
        let ac = UIAlertController(title: "Добавить товар?", message: product.name, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Да", style: .default) { action in
                        self.viewModel.addToBasket(with: indexPath.row)
                    }
                    ac.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Нет", style: .cancel) { action in
                    }
                    ac.addAction(cancelAction)
                    self.present(ac, animated: true, completion: nil)
    }
    
    
    @IBAction func basketButton(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let destinationVC = storyboard.instantiateViewController(withIdentifier: "BasketViewController") as! BasketViewController
        self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
}

extension ProductsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addToBasketRequest(indexPath)
       }
}

extension ProductsViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product: Products.Item = viewModel.getProduct(by: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! UITableViewCell
        cell.textLabel?.text = product.name + " " + "\(product.price)"
        cell.detailTextLabel?.text = product.description
        return cell
    }
    
}
