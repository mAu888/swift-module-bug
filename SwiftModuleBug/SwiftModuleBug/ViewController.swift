//
//  ViewController.swift
//  SwiftModuleBug
//
//  Created by Mauricio Hanika on 04/07/16.
//  Copyright © 2016 Maurício Hanika. All rights reserved.
//

import UIKit
import IncludingFramework

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Manager()
    }
}
