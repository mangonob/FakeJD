//
//  Examples.swift
//  FakeJD
//
//  Created by mangonob on 2023/3/17.
//

import SwiftUI
import Charts
import LocalAuthentication

struct Examples: View {
    var body: some View {
        VStack {
            Button("LocalAuth") {
                Task {
                    do {
                        try await startLocalAuth()
                        print("success")
                    } catch {
                        print(error)
                    }
                }
            }.foregroundColor(.gray)
        }
    }
}

func startLocalAuth() async throws -> Void {
    let context = LAContext()
    var error: NSError?
    
    guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
        if let error = error {
            throw error
        } else {
            return
        }
    }
    
    return try await withUnsafeThrowingContinuation { continuation in
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "local authrization") { success, error in
            if success {
                continuation.resume(returning: ())
            } else if let error = error {
                continuation.resume(throwing: error)
            } else {
                continuation.resume()
            }
        }
    }
}

struct Examples_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Examples()
        }
    }
}
