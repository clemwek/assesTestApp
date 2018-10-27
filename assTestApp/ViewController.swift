import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet weak var itemTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTable.delegate = self
        itemTable.dataSource = self
        
        //Register custom cell
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemTable.register(nib, forCellReuseIdentifier: "ItemCell")
        
        viewModel.get()
        itemTable.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.itemList.count)
        return viewModel.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        return cell
    }
    
}

