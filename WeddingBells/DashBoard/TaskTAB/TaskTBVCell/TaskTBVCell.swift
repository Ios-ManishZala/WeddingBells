//
//  TaskTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class TaskTBVCell: UITableViewCell {

    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var lblTaskDes: UILabel!
    @IBOutlet weak var lblTaskListName: UILabel!
    @IBOutlet weak var taskImage: UIImageView!
    var taskData:TaskDataModel? {
        didSet{
            self.taskImage.image = taskData?.taskImage
            self.lblTaskDes.text = taskData?.taskDes
            self.lblTaskListName.text = taskData?.taskName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.taskView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
