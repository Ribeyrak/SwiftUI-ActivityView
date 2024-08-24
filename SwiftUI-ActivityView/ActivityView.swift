//
//  ActivityView.swift
//  SwiftUI-ActivityView
//
//  Created by Evhen Lukhtan on 22.08.2024.
//

import SwiftUI

class ActivityViewCustomActivity: UIActivity {
    
    // MARK: Properties
    var customActivityType: UIActivity.ActivityType
    var activityName: String
    var activityImageName: String
    var customActionWhenTapped: () -> Void
    
    // MARK: Init
    init(activityName: String, activityImageName: String, customActionWhenTapped: @escaping () -> Void) {
        self.activityName = activityName
        self.activityImageName = activityImageName
        self.customActivityType = UIActivity.ActivityType("Action \(activityName)")
        self.customActionWhenTapped = customActionWhenTapped
        super.init()
    }
    
    // MARK: Overrides
    override var activityType: UIActivity.ActivityType? {
        customActivityType
    }
    
    override var activityTitle: String? {
        activityName
    }
    
    override class var activityCategory: UIActivity.Category {
        .share
    }
    
    override var activityImage: UIImage? {
        return UIImage(named: activityImageName)
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        // empty
    }
    
    override func perform() {
        customActionWhenTapped()
    }
}

struct ActivityView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIActivityViewController
    public var activityItems: [Any]
    public var applicationActivites: [UIActivity]?
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let vc = UIActivityViewController(activityItems: activityItems,
                                          applicationActivities: applicationActivites)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) { }
    
}
