//
//  ViewController.swift
//  Future
//
//  Created by Adrián Ferreyra.
//  @_AdrianFerreyra.
//
//  Copyright (c) 2015 Adrián Ferreyra. All rights reserved.
//
//  Exclusivo para NSConfArg 2015. Buenos Aires, Argentina.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let getResponseString = { unit($0) >>>= getURL >>>= httpGet >>>= responseString }
        
        let response = getResponseString("http://nsconfarg.com")
        
        response.callback = {println("\($0)")}
    }
}