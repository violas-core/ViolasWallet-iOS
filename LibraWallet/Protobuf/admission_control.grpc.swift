//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: admission_control.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Foundation
import Dispatch
import SwiftGRPC
import SwiftProtobuf

internal protocol AdmissionControl_AdmissionControlSubmitTransactionCall: ClientCallUnary {}

fileprivate final class AdmissionControl_AdmissionControlSubmitTransactionCallBase: ClientCallUnaryBase<AdmissionControl_SubmitTransactionRequest, AdmissionControl_SubmitTransactionResponse>, AdmissionControl_AdmissionControlSubmitTransactionCall {
  override class var method: String { return "/admission_control.AdmissionControl/SubmitTransaction" }
}

internal protocol AdmissionControl_AdmissionControlUpdateToLatestLedgerCall: ClientCallUnary {}

fileprivate final class AdmissionControl_AdmissionControlUpdateToLatestLedgerCallBase: ClientCallUnaryBase<Types_UpdateToLatestLedgerRequest, Types_UpdateToLatestLedgerResponse>, AdmissionControl_AdmissionControlUpdateToLatestLedgerCall {
  override class var method: String { return "/admission_control.AdmissionControl/UpdateToLatestLedger" }
}


/// Instantiate AdmissionControl_AdmissionControlServiceClient, then call methods of this protocol to make API calls.
internal protocol AdmissionControl_AdmissionControlService: ServiceClient {
  /// Synchronous. Unary.
  func submitTransaction(_ request: AdmissionControl_SubmitTransactionRequest) throws -> AdmissionControl_SubmitTransactionResponse
  /// Asynchronous. Unary.
  func submitTransaction(_ request: AdmissionControl_SubmitTransactionRequest, completion: @escaping (AdmissionControl_SubmitTransactionResponse?, CallResult) -> Void) throws -> AdmissionControl_AdmissionControlSubmitTransactionCall

  /// Synchronous. Unary.
  func updateToLatestLedger(_ request: Types_UpdateToLatestLedgerRequest) throws -> Types_UpdateToLatestLedgerResponse
  /// Asynchronous. Unary.
  func updateToLatestLedger(_ request: Types_UpdateToLatestLedgerRequest, completion: @escaping (Types_UpdateToLatestLedgerResponse?, CallResult) -> Void) throws -> AdmissionControl_AdmissionControlUpdateToLatestLedgerCall

}

internal final class AdmissionControl_AdmissionControlServiceClient: ServiceClientBase, AdmissionControl_AdmissionControlService {
  /// Synchronous. Unary.
  internal func submitTransaction(_ request: AdmissionControl_SubmitTransactionRequest) throws -> AdmissionControl_SubmitTransactionResponse {
    return try AdmissionControl_AdmissionControlSubmitTransactionCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func submitTransaction(_ request: AdmissionControl_SubmitTransactionRequest, completion: @escaping (AdmissionControl_SubmitTransactionResponse?, CallResult) -> Void) throws -> AdmissionControl_AdmissionControlSubmitTransactionCall {
    return try AdmissionControl_AdmissionControlSubmitTransactionCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func updateToLatestLedger(_ request: Types_UpdateToLatestLedgerRequest) throws -> Types_UpdateToLatestLedgerResponse {
    return try AdmissionControl_AdmissionControlUpdateToLatestLedgerCallBase(channel)
      .run(request: request, metadata: metadata)
  }
  /// Asynchronous. Unary.
  internal func updateToLatestLedger(_ request: Types_UpdateToLatestLedgerRequest, completion: @escaping (Types_UpdateToLatestLedgerResponse?, CallResult) -> Void) throws -> AdmissionControl_AdmissionControlUpdateToLatestLedgerCall {
    return try AdmissionControl_AdmissionControlUpdateToLatestLedgerCallBase(channel)
      .start(request: request, metadata: metadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
/// If one of the methods returning `ServerStatus?` returns nil,
/// it is expected that you have already returned a status to the client by means of `session.close`.
internal protocol AdmissionControl_AdmissionControlProvider: ServiceProvider {
  func submitTransaction(request: AdmissionControl_SubmitTransactionRequest, session: AdmissionControl_AdmissionControlSubmitTransactionSession) throws -> AdmissionControl_SubmitTransactionResponse
  func updateToLatestLedger(request: Types_UpdateToLatestLedgerRequest, session: AdmissionControl_AdmissionControlUpdateToLatestLedgerSession) throws -> Types_UpdateToLatestLedgerResponse
}

extension AdmissionControl_AdmissionControlProvider {
  internal var serviceName: String { return "admission_control.AdmissionControl" }

  /// Determines and calls the appropriate request handler, depending on the request's method.
  /// Throws `HandleMethodError.unknownMethod` for methods not handled by this service.
  internal func handleMethod(_ method: String, handler: Handler) throws -> ServerStatus? {
    switch method {
    case "/admission_control.AdmissionControl/SubmitTransaction":
      return try AdmissionControl_AdmissionControlSubmitTransactionSessionBase(
        handler: handler,
        providerBlock: { try self.submitTransaction(request: $0, session: $1 as! AdmissionControl_AdmissionControlSubmitTransactionSessionBase) })
          .run()
    case "/admission_control.AdmissionControl/UpdateToLatestLedger":
      return try AdmissionControl_AdmissionControlUpdateToLatestLedgerSessionBase(
        handler: handler,
        providerBlock: { try self.updateToLatestLedger(request: $0, session: $1 as! AdmissionControl_AdmissionControlUpdateToLatestLedgerSessionBase) })
          .run()
    default:
      throw HandleMethodError.unknownMethod
    }
  }
}

internal protocol AdmissionControl_AdmissionControlSubmitTransactionSession: ServerSessionUnary {}

fileprivate final class AdmissionControl_AdmissionControlSubmitTransactionSessionBase: ServerSessionUnaryBase<AdmissionControl_SubmitTransactionRequest, AdmissionControl_SubmitTransactionResponse>, AdmissionControl_AdmissionControlSubmitTransactionSession {}

internal protocol AdmissionControl_AdmissionControlUpdateToLatestLedgerSession: ServerSessionUnary {}

fileprivate final class AdmissionControl_AdmissionControlUpdateToLatestLedgerSessionBase: ServerSessionUnaryBase<Types_UpdateToLatestLedgerRequest, Types_UpdateToLatestLedgerResponse>, AdmissionControl_AdmissionControlUpdateToLatestLedgerSession {}

