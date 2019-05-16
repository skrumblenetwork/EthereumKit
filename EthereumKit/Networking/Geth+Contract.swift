import CryptoSwift

extension Geth {
    
    /// getBalance returns currenct balance of specified address.
    ///
    /// - Parameters:
    ///   - contract: ERC20 object
    ///   - address: address you want to get the balance of
    ///   - completionHandler:
    public func getTokenBalance(contract: ERC20, address: String, completionHandler: @escaping (Result<Balance>) -> Void) {
        
        let data = ERC20.ContractFunctions.balanceOf(address: address).data

        self.call(to: contract.contractAddress, data: data.toHexString().addHexPrefix()) { result in
            
            switch result {
            case .success(let hexBalance):
                
                if let wei = Wei(hexBalance.lowercased().stripHexPrefix(), radix: 16) {
                    let balance = Balance(wei: wei)
                    completionHandler(.success(balance))
                } else {
                    completionHandler(.failure(EthereumKitError.convertError(.failedToConvert(hexBalance))))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    public func approve(contract: ERC20, from wallet: String, spender address: String, amount: String, completionHandler: @escaping (Result<Bool>) -> Void) {

        let data = try! contract.generateApproveDataParameter(spender: address, amount: amount)
        
        self.call(from: wallet, to: contract.contractAddress, data: data.toHexString().addHexPrefix()) { result in
            
            switch result {
            case .success(let hex):
                
                if let wei = BInt(hex.lowercased().stripHexPrefix(), radix: 16) {
                    let success = wei.isNotZero()
                    completionHandler(.success(success))
                } else {
                    completionHandler(.failure(EthereumKitError.convertError(.failedToConvert(hex))))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
