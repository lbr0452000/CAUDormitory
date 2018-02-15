//
//  SettingTabTableViewController.swift
//  CAUDormitory
//
//  Created by CAUADC on 2018. 2. 8..
//  Copyright © 2018년 CAUADC. All rights reserved.
//

import UIKit

protocol settingElement {
    var name:String {get}
    var identifier:String {get}
    func setCell(cell:UITableViewCell) -> UITableViewCell
    func initializeKey()
    func selected(_ tableView:UITableView)
}

class settingStudentID:settingElement {
    var name:String
    var identifier: String = "detail"
    init(name:String) {
        self.name = name
    }
    func read() -> Int {
        return UserDefaults.standard.integer(forKey: "setting_" + name)
    }
    func write(_ to:Int) {
        UserDefaults.standard.set(to, forKey: "setting_" + name)
    }
    func setCell(cell: UITableViewCell) -> UITableViewCell{
        let resultCell = cell as! SettingDetailTableViewCell
        resultCell.cellName.text = name
        resultCell.cellDetail.text = String(read())
        return resultCell
    }
    func initializeKey() {
        write(20180000)
    }
    func selected(_ tableView:UITableView) {
        let alertController = UIAlertController(title: "학번 수정", message: " ", preferredStyle: .alert)
        
        let adjustAction = UIAlertAction(title: "수정", style: .default) {(_) in
            let ID = alertController.textFields![0] as UITextField
            let value = Int(ID.text!)
            
            if value == nil {
                let alertErrorController = alertController
                alertErrorController.message = "학번을 입력해주세요"
                UIApplication.shared.keyWindow?.rootViewController?.present(alertErrorController, animated: true, completion: nil)
            } else if value! < 10000000 {
                let alertErrorController = alertController
                alertErrorController.message = "여덟 자리 학번을 입력해주세요"
                UIApplication.shared.keyWindow?.rootViewController?.present(alertErrorController, animated: true, completion: nil)
            }else if (value! < 20190000) && (value! > 19180000) {
                studentID.write(value!)
                tableView.reloadData()
            } else {
                let alertErrorController = alertController
                alertErrorController.message = "올바른 학번을 입력해주세요"
                UIApplication.shared.keyWindow?.rootViewController?.present(alertErrorController, animated: true, completion: nil)
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addTextField(configurationHandler: {(textField) in
            textField.placeholder = "학번(8자리)"
            textField.keyboardType = .numberPad
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(adjustAction)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
class settingStudentGender:settingElement {
    var name:String
    var identifier: String = "detail"
    init(name:String) {
        self.name = name
    }
    func read() -> Gender {
        return Gender(rawValue: (UserDefaults.standard.integer(forKey: "setting_" + name)))!
    }
    func write(_ to:Gender) {
        UserDefaults.standard.set(to.rawValue, forKey: "setting_" + name)
    }
    func setCell(cell: UITableViewCell) -> UITableViewCell{
        let resultCell = cell as! SettingDetailTableViewCell
        resultCell.cellName.text = name
        resultCell.cellDetail.text = read().korean
        return resultCell
    }
    func initializeKey() {
        write(.man)
    }
    
    func selected(_ tableView:UITableView) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = GenderPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.dataSource = pickerView
        pickerView.delegate = pickerView
        vc.view.addSubview(pickerView)
        let editRadiusAlert = UIAlertController(title: "Choose distance", message: "", preferredStyle: .alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: {(_) in
            tableView.reloadData()
        }))
        editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(editRadiusAlert, animated: true, completion: nil)
    }
}
class settingDormitoryBuilding:settingElement {
    var name:String
    var identifier: String = "detail"
    init(name:String) {
        self.name = name
    }
    func read() -> DormitoryBuilding {
        return DormitoryBuilding(rawValue: (UserDefaults.standard.integer(forKey: "setting_" + name)))!
    }
    func write(_ to:DormitoryBuilding) {
        UserDefaults.standard.set(to.rawValue, forKey: "setting_" + name)
    }
    func setCell(cell: UITableViewCell) -> UITableViewCell{
        let resultCell = cell as! SettingDetailTableViewCell
        resultCell.cellName.text = name
        resultCell.cellDetail.text = read().korean
        return resultCell
    }
    func initializeKey() {
        write(.blueMir309)
    }
    
    func selected(_ tableView:UITableView) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerView = BuildingPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerView.dataSource = pickerView
        pickerView.delegate = pickerView
        vc.view.addSubview(pickerView)
        let editRadiusAlert = UIAlertController(title: "Choose distance", message: "", preferredStyle: .alert)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        editRadiusAlert.addAction(UIAlertAction(title: "Done", style: .default, handler: {(_) in
            tableView.reloadData()
        }))
        editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(editRadiusAlert, animated: true, completion: nil)
    }
}
class settingDormitoryRoom:settingElement {
    var name:String
    var identifier: String = "detail"
    init(name:String) {
        self.name = name
    }
    func read() -> Int {
        return UserDefaults.standard.integer(forKey: "setting_" + name)
    }
    func write(_ to:Int) {
        UserDefaults.standard.set(to, forKey: "setting_" + name)
    }
    func setCell(cell: UITableViewCell) -> UITableViewCell{
        let resultCell = cell as! SettingDetailTableViewCell
        resultCell.cellName.text = name
        resultCell.cellDetail.text = String(read())
        return resultCell
    }
    func initializeKey() {
        write(0)
    }
    func selected(_ tableView:UITableView) {
        let alertController = UIAlertController(title: "기숙사 호실 수정", message: " ", preferredStyle: .alert)
        
        let adjustAction = UIAlertAction(title: "수정", style: .default) {(_) in
            let roomNum = alertController.textFields![0] as UITextField
            let value = Int(roomNum.text!)
            
            dormitoryRoom.write(value!)
            tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addTextField(configurationHandler: {(textField) in
            textField.placeholder = "호실 번호"
            textField.keyboardType = .numberPad
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(adjustAction)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

class settingAlertElement:settingElement {
    var name:String
    var identifier: String = "alert"
    init(name:String) {
        self.name = name
    }
    func read() -> Bool {
        return UserDefaults.standard.bool(forKey: "setting_" + name)
    }
    func write(_ to:Bool) {
        UserDefaults.standard.set(to, forKey: "setting_" + name)
    }
    func setCell(cell:UITableViewCell) -> UITableViewCell  {
        let resultCell = cell as! SettingAlertTableViewCell
        resultCell.cellName.text = name
        resultCell.cellButton.isOn = read()
        return resultCell
    }
    func initializeKey() {
        write(false)
    }
    func selected(_ tableView:UITableView) {
        
    }
}
class settingBoolElement:settingElement {
    var name:String
    var identifier: String = "bool"
    init(name:String) {
        self.name = name
    }
    func read() -> Bool {
        return UserDefaults.standard.bool(forKey: "setting_" + name)
    }
    func write(_ to:Bool) {
        UserDefaults.standard.set(to, forKey: "setting_" + name)
    }
    func setCell(cell:UITableViewCell) -> UITableViewCell {
        let resultCell = cell as! SettingButtonTableViewCell
        resultCell.cellName.text = name
        resultCell.cellButton.isOn = read()
        return resultCell
    }
    func initializeKey() {
        write(false)
    }
    func selected(_ tableView:UITableView) {
        
    }
}







let studentID = settingStudentID(name:"학번")
let studentGender = settingStudentGender(name: "성별")
let dormitoryBuilding = settingDormitoryBuilding(name: "생활관 건물")
let dormitoryRoom = settingDormitoryRoom(name: "생활관 호실")

var setting:[[settingElement]] = [
    [studentID,
     studentGender],
    
    [dormitoryBuilding,
     dormitoryRoom],
    
    [settingAlertElement(name:"푸시알림"),
     settingBoolElement(name:"정기생활점검"),
     settingBoolElement(name:"정기소방훈련"),
     settingBoolElement(name:"오리엔테이션"),
     settingBoolElement(name:"방역소독"),
     settingBoolElement(name:"입관신청"),
     settingBoolElement(name:"퇴관신청")]
]

class SettingTabTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return setting.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return setting[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let value = setting[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: value.identifier, for: indexPath)
        
        return value.setCell(cell: cell)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "사용자 정보"
        case 1:
            return "호실 정보"
        case 2:
            return "푸시알림"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setting[indexPath.section][indexPath.row].selected(tableView)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
