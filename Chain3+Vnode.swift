//
//  Chain3+Vnode.swift
//  chain3swift
//
//  Created by Alexander Vlasov on 22.12.2017.
//  Copyright © 2017 Bankex Foundation. All rights reserved.
//
//  Modifications copyright © 2018 Liwei Zhang. All rights reserved.
//

import BigInt
import Foundation
import PromiseKit

/// Extension located
public class Chain3Vnode: Chain3OptionsInheritable {
    /// provider for some functions
    var provider: Chain3Provider
    unowned var chain3: Chain3
    public var options: Chain3Options {
        return chain3.options
    }
    
    public init(provider prov: Chain3Provider, chain3 chain3instance: Chain3) {
        provider = prov
        chain3 = chain3instance
    }
    
    
    public func getVnodeAddress() -> Promise<Address> {
        let queue = chain3.requestDispatcher.queue
        let request = JsonRpcRequestFabric.prepareRequest(.vnVnodeAddress, parameters: [])
        let rp = chain3.dispatch(request)
        return rp.map(on: queue) { response in
            guard let value: Address = response.getValue() else {
                if response.error != nil {
                    throw Chain3Error.nodeError(response.error!.message)
                }
                throw Chain3Error.nodeError("Invalid value from LBR node")
            }
            return value
        }
    }
    
    public func scsServiceEnabled() -> Promise<Bool> {
        let queue = chain3.requestDispatcher.queue
        let request = JsonRpcRequestFabric.prepareRequest(.vnScsService, parameters: [])
        let rp = chain3.dispatch(request)
        return rp.map(on: queue) { response in
            guard let value: Bool = response.getValue() else {
                if response.error != nil {
                    throw Chain3Error.nodeError(response.error!.message)
                }
                throw Chain3Error.nodeError("Invalid value from LBR node")
            }
            return value
        }
    }
    
    public func getServiceCfg() -> Promise<String> {
        let queue = chain3.requestDispatcher.queue
        let request = JsonRpcRequestFabric.prepareRequest(.vnServiceCfg, parameters: [])
        let rp = chain3.dispatch(request)
        return rp.map(on: queue) { response in
            guard let value: String = response.getValue() else {
                if response.error != nil {
                    throw Chain3Error.nodeError(response.error!.message)
                }
                throw Chain3Error.nodeError("Invalid value from LBR node")
            }
            return value
        }
    }
    
    public func showToPublicEnabled() -> Promise<Bool> {
        let queue = chain3.requestDispatcher.queue
        let request = JsonRpcRequestFabric.prepareRequest(.vnShowToPublic, parameters: [])
        let rp = chain3.dispatch(request)
        return rp.map(on: queue) { response in
            guard let value: Bool = response.getValue() else {
                if response.error != nil {
                    throw Chain3Error.nodeError(response.error!.message)
                }
                throw Chain3Error.nodeError("Invalid value from LBR node")
            }
            return value
        }
    }
    
    public func getVnodeIP() -> Promise<String> {
        let queue = chain3.requestDispatcher.queue
        let request = JsonRpcRequestFabric.prepareRequest(.vnVnodeIP, parameters: [])
        let rp = chain3.dispatch(request)
        return rp.map(on: queue) { response in
            guard let value: String = response.getValue() else {
                if response.error != nil {
                    throw Chain3Error.nodeError(response.error!.message)
                }
                throw Chain3Error.nodeError("Invalid value from LBR node")
            }
            return value
        }
    }
    
}
