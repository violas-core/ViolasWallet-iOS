// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proof.proto
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

struct Types_AccumulatorProof {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The bitmap indicating which siblings are default. 1 means non-default and
  /// 0 means default. The LSB corresponds to the sibling at the bottom of the
  /// accumulator. The leftmost 1-bit corresponds to the sibling at the level
  /// just below root level in the accumulator, since this one is always
  /// non-default.
  var bitmap: UInt64 = 0

  /// The non-default siblings. The ones near the root are at the beginning of
  /// the list.
  var nonDefaultSiblings: [Data] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Types_SparseMerkleProof {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// This proof can be used to authenticate whether a given leaf exists in the
  /// tree or not. In Rust:
  ///   - If this is `Some(HashValue, HashValue)`
  ///     - If the first `HashValue` equals requested key, this is an inclusion
  ///       proof and the second `HashValue` equals the hash of the
  ///       corresponding account blob.
  ///     - Otherwise this is a non-inclusion proof. The first `HashValue` is
  ///       the only key that exists in the subtree and the second `HashValue`
  ///       equals the hash of the corresponding account blob.
  ///   - If this is `None`, this is also a non-inclusion proof which indicates
  ///     the subtree is empty.
  ///
  /// In protobuf, this leaf field should either be
  ///   - empty, which corresponds to None in the Rust structure.
  ///   - exactly 64 bytes, which corresponds to Some<(HashValue, HashValue)>
  ///     in the Rust structure.
  var leaf: Data = SwiftProtobuf.Internal.emptyData

  /// The bitmap indicating which siblings are default. 1 means non-default and
  /// 0 means default. The MSB of the first byte corresponds to the sibling at
  /// the top of the Sparse Merkle Tree. The rightmost 1-bit of the last byte
  /// corresponds to the sibling at the bottom, since this one is always
  /// non-default.
  var bitmap: Data = SwiftProtobuf.Internal.emptyData

  /// The non-default siblings. The ones near the root are at the beginning of
  /// the list.
  var nonDefaultSiblings: [Data] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Types_AccumulatorConsistencyProof {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The root hashes of the frozen subtrees that form the small accumulator.
  /// Note that none of these hashes should be default hash.
  var frozenSubtreeRoots: [Data] = []

  /// The total number of siblings.
  var numSiblings: UInt32 = 0

  /// The non-default siblings. Note that the entire list of siblings always
  /// start of zero or more non-default siblings, followed by zero of more
  /// default siblings. So given the total number of siblings and the non-default
  /// siblings we should be able to construct the entire sibling list.
  var nonDefaultSiblings: [Data] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// The complete proof used to authenticate a signed transaction.
struct Types_SignedTransactionProof {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var ledgerInfoToTransactionInfoProof: Types_AccumulatorProof {
    get {return _storage._ledgerInfoToTransactionInfoProof ?? Types_AccumulatorProof()}
    set {_uniqueStorage()._ledgerInfoToTransactionInfoProof = newValue}
  }
  /// Returns true if `ledgerInfoToTransactionInfoProof` has been explicitly set.
  var hasLedgerInfoToTransactionInfoProof: Bool {return _storage._ledgerInfoToTransactionInfoProof != nil}
  /// Clears the value of `ledgerInfoToTransactionInfoProof`. Subsequent reads from it will return its default value.
  mutating func clearLedgerInfoToTransactionInfoProof() {_storage._ledgerInfoToTransactionInfoProof = nil}

  var transactionInfo: Types_TransactionInfo {
    get {return _storage._transactionInfo ?? Types_TransactionInfo()}
    set {_uniqueStorage()._transactionInfo = newValue}
  }
  /// Returns true if `transactionInfo` has been explicitly set.
  var hasTransactionInfo: Bool {return _storage._transactionInfo != nil}
  /// Clears the value of `transactionInfo`. Subsequent reads from it will return its default value.
  mutating func clearTransactionInfo() {_storage._transactionInfo = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// The complete proof used to authenticate an account state.
struct Types_AccountStateProof {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var ledgerInfoToTransactionInfoProof: Types_AccumulatorProof {
    get {return _storage._ledgerInfoToTransactionInfoProof ?? Types_AccumulatorProof()}
    set {_uniqueStorage()._ledgerInfoToTransactionInfoProof = newValue}
  }
  /// Returns true if `ledgerInfoToTransactionInfoProof` has been explicitly set.
  var hasLedgerInfoToTransactionInfoProof: Bool {return _storage._ledgerInfoToTransactionInfoProof != nil}
  /// Clears the value of `ledgerInfoToTransactionInfoProof`. Subsequent reads from it will return its default value.
  mutating func clearLedgerInfoToTransactionInfoProof() {_storage._ledgerInfoToTransactionInfoProof = nil}

  var transactionInfo: Types_TransactionInfo {
    get {return _storage._transactionInfo ?? Types_TransactionInfo()}
    set {_uniqueStorage()._transactionInfo = newValue}
  }
  /// Returns true if `transactionInfo` has been explicitly set.
  var hasTransactionInfo: Bool {return _storage._transactionInfo != nil}
  /// Clears the value of `transactionInfo`. Subsequent reads from it will return its default value.
  mutating func clearTransactionInfo() {_storage._transactionInfo = nil}

  var transactionInfoToAccountProof: Types_SparseMerkleProof {
    get {return _storage._transactionInfoToAccountProof ?? Types_SparseMerkleProof()}
    set {_uniqueStorage()._transactionInfoToAccountProof = newValue}
  }
  /// Returns true if `transactionInfoToAccountProof` has been explicitly set.
  var hasTransactionInfoToAccountProof: Bool {return _storage._transactionInfoToAccountProof != nil}
  /// Clears the value of `transactionInfoToAccountProof`. Subsequent reads from it will return its default value.
  mutating func clearTransactionInfoToAccountProof() {_storage._transactionInfoToAccountProof = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

/// The complete proof used to authenticate an event.
struct Types_EventProof {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var ledgerInfoToTransactionInfoProof: Types_AccumulatorProof {
    get {return _storage._ledgerInfoToTransactionInfoProof ?? Types_AccumulatorProof()}
    set {_uniqueStorage()._ledgerInfoToTransactionInfoProof = newValue}
  }
  /// Returns true if `ledgerInfoToTransactionInfoProof` has been explicitly set.
  var hasLedgerInfoToTransactionInfoProof: Bool {return _storage._ledgerInfoToTransactionInfoProof != nil}
  /// Clears the value of `ledgerInfoToTransactionInfoProof`. Subsequent reads from it will return its default value.
  mutating func clearLedgerInfoToTransactionInfoProof() {_storage._ledgerInfoToTransactionInfoProof = nil}

  var transactionInfo: Types_TransactionInfo {
    get {return _storage._transactionInfo ?? Types_TransactionInfo()}
    set {_uniqueStorage()._transactionInfo = newValue}
  }
  /// Returns true if `transactionInfo` has been explicitly set.
  var hasTransactionInfo: Bool {return _storage._transactionInfo != nil}
  /// Clears the value of `transactionInfo`. Subsequent reads from it will return its default value.
  mutating func clearTransactionInfo() {_storage._transactionInfo = nil}

  var transactionInfoToEventProof: Types_AccumulatorProof {
    get {return _storage._transactionInfoToEventProof ?? Types_AccumulatorProof()}
    set {_uniqueStorage()._transactionInfoToEventProof = newValue}
  }
  /// Returns true if `transactionInfoToEventProof` has been explicitly set.
  var hasTransactionInfoToEventProof: Bool {return _storage._transactionInfoToEventProof != nil}
  /// Clears the value of `transactionInfoToEventProof`. Subsequent reads from it will return its default value.
  mutating func clearTransactionInfoToEventProof() {_storage._transactionInfoToEventProof = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "types"

extension Types_AccumulatorProof: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AccumulatorProof"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "bitmap"),
    2: .standard(proto: "non_default_siblings"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self.bitmap)
      case 2: try decoder.decodeRepeatedBytesField(value: &self.nonDefaultSiblings)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.bitmap != 0 {
      try visitor.visitSingularUInt64Field(value: self.bitmap, fieldNumber: 1)
    }
    if !self.nonDefaultSiblings.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.nonDefaultSiblings, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: Types_AccumulatorProof) -> Bool {
    if self.bitmap != other.bitmap {return false}
    if self.nonDefaultSiblings != other.nonDefaultSiblings {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Types_SparseMerkleProof: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SparseMerkleProof"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "leaf"),
    2: .same(proto: "bitmap"),
    3: .standard(proto: "non_default_siblings"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.leaf)
      case 2: try decoder.decodeSingularBytesField(value: &self.bitmap)
      case 3: try decoder.decodeRepeatedBytesField(value: &self.nonDefaultSiblings)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.leaf.isEmpty {
      try visitor.visitSingularBytesField(value: self.leaf, fieldNumber: 1)
    }
    if !self.bitmap.isEmpty {
      try visitor.visitSingularBytesField(value: self.bitmap, fieldNumber: 2)
    }
    if !self.nonDefaultSiblings.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.nonDefaultSiblings, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: Types_SparseMerkleProof) -> Bool {
    if self.leaf != other.leaf {return false}
    if self.bitmap != other.bitmap {return false}
    if self.nonDefaultSiblings != other.nonDefaultSiblings {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Types_AccumulatorConsistencyProof: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AccumulatorConsistencyProof"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "frozen_subtree_roots"),
    2: .standard(proto: "num_siblings"),
    3: .standard(proto: "non_default_siblings"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedBytesField(value: &self.frozenSubtreeRoots)
      case 2: try decoder.decodeSingularUInt32Field(value: &self.numSiblings)
      case 3: try decoder.decodeRepeatedBytesField(value: &self.nonDefaultSiblings)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.frozenSubtreeRoots.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.frozenSubtreeRoots, fieldNumber: 1)
    }
    if self.numSiblings != 0 {
      try visitor.visitSingularUInt32Field(value: self.numSiblings, fieldNumber: 2)
    }
    if !self.nonDefaultSiblings.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.nonDefaultSiblings, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: Types_AccumulatorConsistencyProof) -> Bool {
    if self.frozenSubtreeRoots != other.frozenSubtreeRoots {return false}
    if self.numSiblings != other.numSiblings {return false}
    if self.nonDefaultSiblings != other.nonDefaultSiblings {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Types_SignedTransactionProof: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SignedTransactionProof"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "ledger_info_to_transaction_info_proof"),
    2: .standard(proto: "transaction_info"),
  ]

  fileprivate class _StorageClass {
    var _ledgerInfoToTransactionInfoProof: Types_AccumulatorProof? = nil
    var _transactionInfo: Types_TransactionInfo? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _ledgerInfoToTransactionInfoProof = source._ledgerInfoToTransactionInfoProof
      _transactionInfo = source._transactionInfo
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._ledgerInfoToTransactionInfoProof)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._transactionInfo)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._ledgerInfoToTransactionInfoProof {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._transactionInfo {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: Types_SignedTransactionProof) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._ledgerInfoToTransactionInfoProof != other_storage._ledgerInfoToTransactionInfoProof {return false}
        if _storage._transactionInfo != other_storage._transactionInfo {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Types_AccountStateProof: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AccountStateProof"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "ledger_info_to_transaction_info_proof"),
    2: .standard(proto: "transaction_info"),
    3: .standard(proto: "transaction_info_to_account_proof"),
  ]

  fileprivate class _StorageClass {
    var _ledgerInfoToTransactionInfoProof: Types_AccumulatorProof? = nil
    var _transactionInfo: Types_TransactionInfo? = nil
    var _transactionInfoToAccountProof: Types_SparseMerkleProof? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _ledgerInfoToTransactionInfoProof = source._ledgerInfoToTransactionInfoProof
      _transactionInfo = source._transactionInfo
      _transactionInfoToAccountProof = source._transactionInfoToAccountProof
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._ledgerInfoToTransactionInfoProof)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._transactionInfo)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._transactionInfoToAccountProof)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._ledgerInfoToTransactionInfoProof {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._transactionInfo {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._transactionInfoToAccountProof {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: Types_AccountStateProof) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._ledgerInfoToTransactionInfoProof != other_storage._ledgerInfoToTransactionInfoProof {return false}
        if _storage._transactionInfo != other_storage._transactionInfo {return false}
        if _storage._transactionInfoToAccountProof != other_storage._transactionInfoToAccountProof {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Types_EventProof: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EventProof"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "ledger_info_to_transaction_info_proof"),
    2: .standard(proto: "transaction_info"),
    3: .standard(proto: "transaction_info_to_event_proof"),
  ]

  fileprivate class _StorageClass {
    var _ledgerInfoToTransactionInfoProof: Types_AccumulatorProof? = nil
    var _transactionInfo: Types_TransactionInfo? = nil
    var _transactionInfoToEventProof: Types_AccumulatorProof? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _ledgerInfoToTransactionInfoProof = source._ledgerInfoToTransactionInfoProof
      _transactionInfo = source._transactionInfo
      _transactionInfoToEventProof = source._transactionInfoToEventProof
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._ledgerInfoToTransactionInfoProof)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._transactionInfo)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._transactionInfoToEventProof)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._ledgerInfoToTransactionInfoProof {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._transactionInfo {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._transactionInfoToEventProof {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: Types_EventProof) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._ledgerInfoToTransactionInfoProof != other_storage._ledgerInfoToTransactionInfoProof {return false}
        if _storage._transactionInfo != other_storage._transactionInfo {return false}
        if _storage._transactionInfoToEventProof != other_storage._transactionInfoToEventProof {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
