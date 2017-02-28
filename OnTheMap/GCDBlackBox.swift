//
//  GCDBlackBox.swift
//  OnTheMap
//
//  Created by Ryan Smith on 2/14/17.
//  Copyright © 2017 Ryan Smith. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
