
import UIKit
class checkList {
    var title:String
    var isChecked:Bool = false
    
    init(title:String) {
        self.title = title
    }
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let items:[checkList] =
        [
             "Milk","Tea Powder","Buffole Milk","Make a youtube video"
        ].compactMap { checkList(title: $0)}

    var seletedItem:[String] = []
    //closure
    let table1:UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        table1.separatorColor = .brown
        table1.delegate = self
        table1.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(table1)
        table1.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        table1.reloadData()
    }
     

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table1.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        // its true check mark else none
        cell.accessoryType = items[indexPath.row].isChecked ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table1.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        item.isChecked = !item.isChecked
        table1.reloadRows(at: [indexPath], with: .automatic)
        if(item.isChecked)
        {
            seletedItem.append(item.title)
            print(seletedItem) // array can be hold multiple values
            print (Set(seletedItem)) // set used for filter unique values.
            
        }
    }
}
