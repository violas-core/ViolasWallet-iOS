// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: secret_service.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

// Copyright (c) The Libra Core Contributors
// SPDX-License-Identifier: Apache-2.0

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

enum SecretService_ErrorCode: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case success // = 0
  case keyIDNotFound // = 1
  case wrongLength // = 2
  case invalidParameters // = 3
  case authenticationFailed // = 4
  case unspecified // = 5
  case UNRECOGNIZED(Int)

  init() {
    self = .success
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .success
    case 1: self = .keyIDNotFound
    case 2: self = .wrongLength
    case 3: self = .invalidParameters
    case 4: self = .authenticationFailed
    case 5: self = .unspecified
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .success: return 0
    case .keyIDNotFound: return 1
    case .wrongLength: return 2
    case .invalidParameters: return 3
    case .authenticationFailed: return 4
    case .unspecified: return 5
    case .UNRECOGNIZED(let i): return i
    }
  }

}

enum SecretService_KeyType: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case ed25519 // = 0
  case bls12381 // = 1
  case UNRECOGNIZED(Int)

  init() {
    self = .ed25519
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .ed25519
    case 1: self = .bls12381
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .ed25519: return 0
    case .bls12381: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

struct SecretService_GenerateKeyRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Spec gives a way to generate the key (potentially BIP32 private derivation path here)
  var spec: SecretService_KeyType = .ed25519

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct SecretService_GenerateKeyResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var keyID: Data = SwiftProtobuf.Internal.emptyData

  var code: SecretService_ErrorCode = .success

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct SecretService_PublicKeyRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var keyID: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct SecretService_PublicKeyResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var publicKey: Data = SwiftProtobuf.Internal.emptyData

  var code: SecretService_ErrorCode = .success

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct SecretService_SignRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var keyID: Data = SwiftProtobuf.Internal.emptyData

  /// message_hash should be a prehashed message of length crypto::HashValue::LENGTH = 32 bytes
  var messageHash: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct SecretService_SignResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var signature: Data = SwiftProtobuf.Internal.emptyData

  var code: SecretService_ErrorCode = .success

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "secret_service"

extension SecretService_ErrorCode: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "Success"),
    1: .same(proto: "KeyIdNotFound"),
    2: .same(proto: "WrongLength"),
    3: .same(proto: "InvalidParameters"),
    4: .same(proto: "AuthenticationFailed"),
    5: .same(proto: "Unspecified"),
  ]
}

extension SecretService_KeyType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "Ed25519"),
    1: .same(proto: "BLS12381"),
  ]
}

extension SecretService_GenerateKeyRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenerateKeyRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "spec"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.spec)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.spec != .ed25519 {
      try visitor.visitSingularEnumField(value: self.spec, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: SecretService_GenerateKeyRequest) -> Bool {
    if self.spec != other.spec {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension SecretService_GenerateKeyResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenerateKeyResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "key_id"),
    2: .same(proto: "code"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.keyID)
      case 2: try decoder.decodeSingularEnumField(value: &self.code)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.keyID.isEmpty {
      try visitor.visitSingularBytesField(value: self.keyID, fieldNumber: 1)
    }
    if self.code != .success {
      try visitor.visitSingularEnumField(value: self.code, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: SecretService_GenerateKeyResponse) -> Bool {
    if self.keyID != other.keyID {return false}
    if self.code != other.code {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension SecretService_PublicKeyRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PublicKeyRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "key_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.keyID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.keyID.isEmpty {
      try visitor.visitSingularBytesField(value: self.keyID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: SecretService_PublicKeyRequest) -> Bool {
    if self.keyID != other.keyID {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension SecretService_PublicKeyResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PublicKeyResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "public_key"),
    2: .same(proto: "code"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.publicKey)
      case 2: try decoder.decodeSingularEnumField(value: &self.code)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.publicKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.publicKey, fieldNumber: 1)
    }
    if self.code != .success {
      try visitor.visitSingularEnumField(value: self.code, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: SecretService_PublicKeyResponse) -> Bool {
    if self.publicKey != other.publicKey {return false}
    if self.code != other.code {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension SecretService_SignRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SignRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "key_id"),
    2: .standard(proto: "message_hash"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.keyID)
      case 2: try decoder.decodeSingularBytesField(value: &self.messageHash)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.keyID.isEmpty {
      try visitor.visitSingularBytesField(value: self.keyID, fieldNumber: 1)
    }
    if !self.messageHash.isEmpty {
      try visitor.visitSingularBytesField(value: self.messageHash, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: SecretService_SignRequest) -> Bool {
    if self.keyID != other.keyID {return false}
    if self.messageHash != other.messageHash {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension SecretService_SignResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SignResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "signature"),
    2: .same(proto: "code"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.signature)
      case 2: try decoder.decodeSingularEnumField(value: &self.code)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.signature.isEmpty {
      try visitor.visitSingularBytesField(value: self.signature, fieldNumber: 1)
    }
    if self.code != .success {
      try visitor.visitSingularEnumField(value: self.code, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: SecretService_SignResponse) -> Bool {
    if self.signature != other.signature {return false}
    if self.code != other.code {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
