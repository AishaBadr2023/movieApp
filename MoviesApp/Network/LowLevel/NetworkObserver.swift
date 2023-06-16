//
//  NetworkObserver.swift
//  MoviesApp
//
//  Created by Aisha Badr on 14/06/2023.
//

import Foundation
import Alamofire

class NetworkObserver {
    static let sharedInstance = NetworkObserver()
    fileprivate var reachabilityManager: NetworkReachabilityManager?
    
    init() {
       
        reachabilityManager = NetworkReachabilityManager(host: "www.apple.com")
        startMonitoring()
    }
    
    func startMonitoring() {
        reachabilityManager?.startListening(onQueue: DispatchQueue.main, onUpdatePerforming: { (status) in
            if status == .notReachable {
                ToastHelper.showToast(message: "No Internet Connection", icon: "warning.png")
            }
            })
        }
    func isInternetConnection() -> Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    func checkConnection() -> Bool {
        if isInternetConnection() { return true }
        return false
    }
}

