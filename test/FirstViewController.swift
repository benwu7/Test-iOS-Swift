//
//  FirstViewController.swift
//  test
//
//  Created by Shizhang Wu on 10/18/15.
//  Copyright © 2015 Shupai. All rights reserved.
//

import UIKit
import AVOSCloud

class FirstViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        AVUser.logInWithUsernameInBackground("test", password: "test") { (user, error) -> Void in
            AVCloud.callFunctionInBackground("hello", withParameters: nil) { (result, error) -> Void in
                if error == nil {
                    print(result)
                } else {
                    print(error)
                }
                AVUser.logOut()
                AVCloud.callFunctionInBackground("hello", withParameters: nil) { (result, error) -> Void in
                    if error == nil {
                        print(result)
                    } else {
                        print(error)
                    }
                }
            }
        }
    }

}

