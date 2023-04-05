//
//  TaskVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class TaskVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var taskListData = WeddingDecorData.TaskListData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: TaskTBVCell.self)
    }
    
    @IBAction func btnEditAction(_ sender: UIButton) {
        let vc = EditPlanningVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
}

extension TaskVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell = tableView.dequeueReusableCell(withType: TaskTBVCell.self)
        taskCell.taskData = self.taskListData[indexPath.row]
        return taskCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            self.pushVC(TodoListVC())
        }else if indexPath.row == 1 {
            self.pushVC(GuestListVC())
        }else if indexPath.row == 2 {
            self.pushVC(VendorShorlistVC())
        }else if indexPath.row == 3 {
            self.pushVC(BudgetsVC())
        }
    }
}
