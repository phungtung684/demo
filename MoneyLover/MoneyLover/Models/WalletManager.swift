//
//  WalletManager.swift
//  MoneyLover
//
//  Created by Phùng Tùng on 12/5/16.
//  Copyright © 2016 Phùng Tùng. All rights reserved.
//

import UIKit

class WalletManager {
    
    lazy var managedObjectContext = CoreDataManager().managedObjectContext
    var dataStored = DataStored()
    
    func checkWalletNameExits(name: String) -> Bool {
        let listWalletName = dataStored.fetchAttributePredicate("Wallet", attribute: "name", stringPredicate: name, inManagedObjectContext: managedObjectContext)
        if listWalletName.count == 0 {
            return false
        }
        return true
    }
    
    func addWalletAvailable(walletModel: WalletModel) -> Wallet? {
        if let wallet = dataStored.createRecordForEntity("Wallet", inManagedObjectContext: managedObjectContext) as? Wallet {
            wallet.name = walletModel.name
            wallet.idWallet = walletModel.idWallet
            wallet.icon = walletModel.iconName
            wallet.amount = walletModel.amount
            do {
                try managedObjectContext.save()
                return wallet
            } catch let error {
                print(error)
            }
        }
        return nil
    }
    
    func addWallet(walletModel: WalletModel) -> Bool {
        if let wallet = dataStored.createRecordForEntity("Wallet", inManagedObjectContext: managedObjectContext) as? Wallet {
            wallet.name = walletModel.name
            wallet.idWallet = walletModel.idWallet
            wallet.icon = walletModel.iconName
            wallet.amount = walletModel.amount
            do {
                try managedObjectContext.save()
                return true
            } catch {
                return false
            }
        }
        return false
    }
    

}
