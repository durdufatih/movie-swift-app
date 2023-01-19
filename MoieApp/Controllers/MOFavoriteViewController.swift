//
//  MOFavoriteViewController.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 18.01.2023.
//

import UIKit

class MOFavoriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var vm = FavoritePageViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.favoriteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = vm.favoriteData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! MOFavoriteTableViewCell
        
        cell.labelTitle?.text =  model.title
        cell.labelDescription?.text = model.descriptionText
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.vm.getResultOfData { data, load in
            if load {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        vm = FavoritePageViewModel()
        self.tableView.reloadData()
    }
    
    
    
   

}
