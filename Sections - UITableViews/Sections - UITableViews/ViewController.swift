//
//  ViewController.swift
//  Sections - UITableViews
//
//  Created by Johnathan Huijon on 9/7/23.
//

// This file is a comprehensive guide on working with sections in UITableViews in iOS development. Sections in UITableViews allow developers to organize and present data in a structured and intuitive manner. The file delves into fundamental concepts such as creating sections, defining their appearance, managing headers and footers, populating cells within sections, and implementing actions specific to sections. It also covers advanced topics like dynamic section management, handling expanded and collapsed sections, and provides best practices to enhance user experience. Developers can refer to this file to gain a deep understanding of effectively implementing and customizing sections in UITableViews for various applications.

import UIKit

// Since we have sections and we want to create a header for each section instead of just adding a title to them, we've created a custom class using UITableViewHeaderFooterView to achieve this customization.
class TableHeaderCell: UITableViewHeaderFooterView {
    
    // In the custom header, we only want to have a label configured to be aligned to the left of the header.
    let topicLabel = UILabel()
    
    // This code is necessary to configure and set UI elements, such as the label, within the custom header.
    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
        configureSetUI()
    }
    
    // This is required if you want to have the function above to configure and set UI elements within the custom header.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // This function will be called when we reach a new section, and it will set the label for that section's header.
    func addLabelText(topic: String) {
        
        let quote = topic.uppercased()
        let font = UIFont.systemFont(ofSize: 13.5)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.gray,
        ]

        let attributedQuote = NSAttributedString(string: quote, attributes: attributes)
        
        topicLabel.attributedText = attributedQuote

    }
    
    func configureSetUI() {
        configureLabel()
        setLabel()
    }

    func setLabel() {
        self.addSubview(topicLabel)
        
        NSLayoutConstraint.activate([
            topicLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            topicLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topicLabel.topAnchor.constraint(equalTo: self.topAnchor),
            topicLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3)
        ])
    }
    
    func configureLabel() {
        topicLabel.textAlignment = .left
        topicLabel.numberOfLines = 1
        
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

// We need a table cell that contains an image view and the username, along with their @name.
class TableProfileCell: UITableViewCell {
    
    let profilePicture = UIImageView()
    let publicName = UILabel()
    let username = UILabel()
    
    
    // This code is necessary to configure and set UI elements, such as the image view and labels, within the custom cell.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setUI()
    }
    
    // This is required if you want to have the function above to configure and set UI elements within the custom cell.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // This function will be called when we reach a specific section and row, and it will create a profile cell similar to what you would see in settings.
    func addUsersInfo(profileImage: UIImage, name: String, atName: String) {
        profilePicture.image = profileImage
        publicName.text = name
        username.text = atName
    }
    
    func setUI() {
        setProfilePic()
        setPublicName()
        setUsername()
    }
    
    func setUsername() {
        self.addSubview(username)
        NSLayoutConstraint.activate([
            username.leadingAnchor.constraint(equalTo: publicName.leadingAnchor),
            username.trailingAnchor.constraint(equalTo: publicName.trailingAnchor),
            username.heightAnchor.constraint(equalTo: publicName.heightAnchor, multiplier: 1),
            username.topAnchor.constraint(equalTo: publicName.bottomAnchor, constant: 5)
        ])
    }

    func setPublicName() {
        self.addSubview(publicName)
        NSLayoutConstraint.activate([
            publicName.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 20),
            publicName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            publicName.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4),
            publicName.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ])
    }
    
    func setProfilePic() {
        self.addSubview(profilePicture)
        NSLayoutConstraint.activate([
            profilePicture.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profilePicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            profilePicture.heightAnchor.constraint(equalToConstant: 75),
            profilePicture.widthAnchor.constraint(equalTo: profilePicture.heightAnchor, multiplier: 1)
        ])
        
        // If you are adding a picture to a table view cell and want to make adjustments to it, such as creating a circular image view, you need to call `layoutIfNeeded()` to ensure proper placement and display within the cell.
        profilePicture.layoutIfNeeded()
        
        profilePicture.layer.borderWidth = 0.05
        profilePicture.layer.masksToBounds = false
        profilePicture.layer.borderColor = UIColor.lightGray.cgColor
        profilePicture.layer.cornerRadius = profilePicture.frame.height/2
        profilePicture.clipsToBounds = true
        
        
        
    }
    
    
    func configureUI() {
        configureProfilePicture()
        configurePublicName()
        configureUsername()
    }
    
    func configureProfilePicture() {
        profilePicture.image = UIImage(systemName: "person.fill")
        profilePicture.tintColor = .purple
        
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configurePublicName() {
        
        publicName.font = .boldSystemFont(ofSize: 20)
        publicName.textAlignment = .left
        publicName.numberOfLines = 1
        
        publicName.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureUsername() {
        
        username.font = .systemFont(ofSize: 15)
        username.textAlignment = .left
        username.numberOfLines = 1
        
        username.translatesAutoresizingMaskIntoConstraints = false
    }
}

class ViewController: UIViewController {

    // Create the necessary variables, including the table and the data we will be using for this example
    let settingsTable = UITableView(frame: .zero, style: .insetGrouped)
    let settingStuctureList = ["Profile", "Features", "Settings", "About"]
    let settingSectionInfo: [[String]] = [["Johny", "@johnyjocose"],["Audio", "Video Preference"], ["Notifications", "Time Zone", "Privacy", "Other"], ["Share Profile", "Rate App", "Help", "About"]]
    
    let settingSectionImages: [[String]] = [["profilePic"],["speaker.wave.2", "video.fill"], ["bell.badge.fill", "globe.americas.fill", "lock.shield", "hammer.circle"], ["square.and.arrow.up", "star", "questionmark.circle", "info.circle"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setTable()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureTable()
    }
    
    // Configure our table; if you have questions about this, refer to the UITableView project in this repository
    func configureTable() {
        settingsTable.dataSource = self
        settingsTable.delegate = self
        // Since we are working with multiple types of cells, such as our profile cell, a basic cell, and the header cell, we need to register all three of them.
        settingsTable.register(TableProfileCell.self, forCellReuseIdentifier: "profileCell")
        settingsTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        settingsTable.register(TableHeaderCell.self, forHeaderFooterViewReuseIdentifier: "headerCell")
        
        
        settingsTable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setTable() {
        view.addSubview(settingsTable)
        NSLayoutConstraint.activate([
            settingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            settingsTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // We need to assign our header cell class we created using this
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Create the header cell here and make sure you use it 'as TableHeaderCell' in order to have access to the functions in the class
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerCell") as? TableHeaderCell else {
            fatalError("Failed to create header cell")
        }
        // Use the function in the class to change the label of the section
        header.addLabelText(topic: settingStuctureList[section])
        return header
    }
    
    // We won't be using this function in this example, but it's here for you to see. If you don't have a header cell to use, you can just use this and return the string you want the section header to be.
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return settingStuctureList[section]
//    }
    
    
    
    // Here is where we set the section count; this will determine how many different cell sections are in the table and will separate them
    func numberOfSections(in tableView: UITableView) -> Int {
        settingStuctureList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if settingStuctureList[indexPath.section] ==  "Profile" {
            return 100
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return settingSectionInfo[section].count
    }
    
    // You can assign different actions to do depending on the section by using if/else or switches
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if settingStuctureList[indexPath.section] ==  "Profile" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! TableProfileCell
            
            if let profileImage = UIImage(named: settingSectionImages[indexPath.section][0]) {
                let publicName = settingSectionInfo[indexPath.section][0]
                let username = settingSectionInfo[indexPath.section][1]
                cell.addUsersInfo(profileImage: profileImage, name: publicName, atName: username)
            }
            
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let tableString = settingSectionInfo[indexPath.section][indexPath.row]
        let tableImage = UIImage(systemName: settingSectionImages[indexPath.section][indexPath.row])
        content.text = tableString
        content.image = tableImage
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
}
