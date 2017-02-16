//
//  ViewController.swift
//  CircleActivityView
//
//  Created by HLH on 2017/2/16.
//  Copyright © 2017年 胡良海. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        let activityView = ActivityView.init(frame: CGRect.init(origin: .zero, size: CGSize.init(width: 60, height: 60)))
        activityView.center = self.view.center
        view.addSubview(activityView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

