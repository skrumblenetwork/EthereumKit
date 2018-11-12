import CryptoSwift

extension Geth {
    
    /// getBalance returns currenct balance of specified address.
    ///
    /// - Parameters:
    ///   - contract: ERC20 object
    ///   - address: address you want to get the balance of
    ///   - completionHandler:
    public func getTokenBalance(contract: ERC20, address: String, completionHandler: @escaping (Result<Balance>) -> Void) {
        
        let data = ERC20.ContractFunctions.balanceOf(address: address).data()

        self.call(to: contract.contractAddress, data: data) { result in
            
            switch result {
            case .success(let hexBalance):
                guard let wei = Wei(hexBalance.lowercased().stripHexPrefix(), radix: 16) else {
                    completionHandler(.failure(EthereumKitError.convertError(.failedToConvert(hexBalance))))
                    return
                }
                let balance = Balance(wei: wei)
                completionHandler(.success(balance))
                break
            case .failure(let error):
                completionHandler(.failure(error))
                break
            }
        }
    }
}