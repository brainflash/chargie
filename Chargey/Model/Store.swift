//
//  Store.swift
//  Chargey
//
//  Created by Brainflash on 24/11/2020.
//

import StoreKit

typealias FetchCompletionHandler = (([SKProduct]) -> Void)
typealias PurchaseCompletionHandler = ((SKPaymentTransaction?) -> Void)

class Store: NSObject, ObservableObject {
	
	// Array of productChargeyPacks, from fetchProducts call
	@Published var productChargeyPacks: [SKProduct]?

	private var model: AppModel?
	
	private let allProductIdentifiers = Set([
		Store.ProductIdentifier.ChargeyPack1,
		Store.ProductIdentifier.ChargeyPack2,
		Store.ProductIdentifier.ChargeyPack3,
		Store.ProductIdentifier.ChargeyPack4,
		Store.ProductIdentifier.ChargeyPack5
	])
	
	private var completedPurchases = [String]()
	private var fetchedProducts = [SKProduct]()
	private var productsRequest: SKProductsRequest?
	private var fetchCompletionHandler: FetchCompletionHandler?
	private var purchaseCompletionHandler: PurchaseCompletionHandler?

	override init() {
		super.init()
	
		// Get notified when access to a product is revoked
		startObservingPaymentQueue()
		fetchProducts { [weak self] products in
			guard let self = self else { return }
			self.productChargeyPacks = products.filter { self.allProductIdentifiers.contains($0.productIdentifier) }
		}
	}
	
	func inject(_ model: AppModel) {
		self.model = model
	}
}

// MARK: - Store API

extension Store {
	struct ProductIdentifier {
		static let AllPacks = "app.chargey.allsets"
		static let ChargeyPack1	= "app.chargey.pack1"
		static let ChargeyPack2	= "app.chargey.pack2"
		static let ChargeyPack3	= "app.chargey.pack3"
		static let ChargeyPack4	= "app.chargey.pack4"
		static let ChargeyPack5	= "app.chargey.pack5"

		static let all: [String] = [
			AllPacks,
			ChargeyPack1,
			ChargeyPack2,
			ChargeyPack3,
			ChargeyPack4,
			ChargeyPack5
		]
	}
	
	func product(for identifier: String) -> SKProduct? {
		return fetchedProducts.first(where: { $0.productIdentifier == identifier })
	}
	
	func purchaseProduct(_ product: SKProduct) {
		startObservingPaymentQueue()
		buy(product) { [weak self] transaction in
			guard let self = self,
				  let transaction = transaction else {
				return
			}

			// Unlock the product(s)
			if self.allProductIdentifiers.contains(transaction.payment.productIdentifier),
			   transaction.transactionState == .purchased {

				if let model = self.model {
					if let chargeyPack = model.chargeyPacks.first(where: { $0.id == transaction.payment.productIdentifier }) {
						chargeyPack.unlock()
					}
				}
			}

		}
	}
}

// MARK: - Private logic

extension Store {
	
	private func buy(_ product: SKProduct, completion: @escaping PurchaseCompletionHandler) {
		// Save our completion handler for later
		purchaseCompletionHandler = completion
		
		// Create the payment and add it to the queue
		let payment = SKPayment(product: product)
		SKPaymentQueue.default().add(payment)
	}
	
	private func hasPurchasedProduct(_ identifier: String) -> Bool {
		completedPurchases.contains(identifier)
	}
	
	private func fetchProducts(_ completion: @escaping FetchCompletionHandler) {
		guard self.productsRequest == nil else {
			return
		}
		// Store our completion handler for later
		fetchCompletionHandler = completion
		
		// Create and start this product request
		productsRequest = SKProductsRequest(productIdentifiers: allProductIdentifiers)
		productsRequest?.delegate = self
		productsRequest?.start()
	}
	
	private func startObservingPaymentQueue() {
		SKPaymentQueue.default().add(self)
	}
}

// MARK: - SKPaymentTransactionObserver

extension Store: SKPaymentTransactionObserver {
	func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
		var shouldFinishTransaction = false
		for transaction in transactions {
			switch transaction.transactionState {
			case .purchased, .restored:
				completedPurchases.append(transaction.payment.productIdentifier)
				shouldFinishTransaction = true
			case .failed:
				shouldFinishTransaction = true
			case .purchasing, .deferred:
				break
			@unknown default:
				break
			}
			if shouldFinishTransaction {
				SKPaymentQueue.default().finishTransaction(transaction)
				DispatchQueue.main.async {
					self.purchaseCompletionHandler?(transaction)
					self.purchaseCompletionHandler = nil
				}
			}
		}
	}

	func paymentQueue(_ queue: SKPaymentQueue, didRevokeEntitlementsForProductIdentifiers productIdentifiers: [String]) {
		// This is called, for example, when a user leaves a family sharing group that was sharing in-app purchases.
		// By leaving the family group, the user is no longer entitled to the shared in-app purchases.
		completedPurchases.removeAll(where: { productIdentifiers.contains($0) })
		DispatchQueue.main.async {
			ProductIdentifier.all.forEach { identifier in
				if let model = self.model {
					if let chargeyPack = model.chargeyPacks.first(where: { $0.id == identifier }) {
						chargeyPack.lock()
					}
				}
			}
		}
	}
	
}

// MARK: - SKProductsRequestDelegate

extension Store: SKProductsRequestDelegate {
	
	func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
		let loadedProducts = response.products
		let invalidProducts = response.invalidProductIdentifiers
		
		guard !loadedProducts.isEmpty else {
			// No valid products found
			var errorMessage = "Could not find any products."
			if !invalidProducts.isEmpty {
				errorMessage = "Invalid products: \(invalidProducts.joined(separator: ", "))"
			}
			print("\(errorMessage)")
			productsRequest = nil
			return
		}
		
		// Cache these for later use
		fetchedProducts = loadedProducts
		
		// Notify anyone waiting on the products
		DispatchQueue.main.async {
			self.fetchCompletionHandler?(loadedProducts)
			
			// Cleanup
			self.fetchCompletionHandler = nil
			self.productsRequest = nil
		}
	}
	
}
