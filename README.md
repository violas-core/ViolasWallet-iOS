# LibraWallet-iOS

---


## 交易数据类型

###一、Argument类型

####1.U64(此处需要注意,金额需要*1000000,单位才是Libra)
类型
```
00000000
```

4个字节类型 + 8个字节金额 = 12个字节

例:1 Libra   

```
0000000040420f0000000000
```
####2.Address
类型
```
01000000
```

4个字节类型 + 4个字节地址长度 + 地址 = (4 + 4 + 地址长度)个字节

例:4fddcee027aa66e4e144d44dd218a345fb5af505284cb03368b7739e92dd6b3c

```
01000000200000004fddcee027aa66e4e144d44dd218a345fb5af505284cb03368b7739e92dd6b3c
```
####3.String
类型
```
02000000
```

4个字节类型 + 4个字节Bytes长度 + Bytes = (4 + 4 + Bytes长度)个字节

例:2c25991785343b23ae073a50e5fd809a2cd867526b3c1db2b0bf5d1924c693ed

```
01000000200000002C25991785343B23AE073A50E5FD809A2CD867526B3C1DB2B0BF5D1924C693ED
```

####4.Bytes
类型
```
03000000
```

4个字节类型 + 4个字节Bytes长度 + Bytes = (4 + 4 + Bytes长度)个字节

例: cafed00d

```
0300000004000000CAFED00D
```
###二、AccessPath类型
####WriteType
#####1.Deletion
类型
```
00000000
```
#####2.Value

cafed00d

```
0100000004000000CAFED00D
```

4个字节Address长度 + Address + 4个字节Path长度 + Path + WriteType = (4 + Address长度 + 4 + Path长度 + WriteType)个字节

例: 

```
[
  (
    AccessPath {
      address: a71d76faa2d2d5c3224ec3d41deb293973564a791e55c6782ba76c2bf0495f9a,
      path: 01217da6c6b3e19f1825cfb2676daecce3bf3de03cf26647c78df00b371b25cc97
    },
    Deletion
  ),
  (
    AccessPath {
      address: c4c63f80c74b11263e421ebf8486a4e398d0dbc09fa7d4f62ccdb309f3aea81f,
      path: 01217da6c6b3e19f18
    },
    cafed00d
  )
]
```
```
0200000020000000A71D76FAA2D2D5C3224EC3D41DEB293973564A791E55C6782BA76C2BF0495F9A2100000001217DA6C6B3E19F1825CFB2676DAECCE3BF3DE03CF26647C78DF00B371B25CC970000000020000000C4C63F80C74B11263E421EBF8486A4E398D0DBC09FA7D4F62CCDB309F3AEA81F0900000001217DA6C6B3E19F180100000004000000CAFED00D
```



###三、Payload
####1.Program
类型
```
00000000
```

Code为move脚本编译生成


4个字节类型 + 4个字节Code长度 + Code + 4个字节Arguments数量 + Argument1 + ··· + Argumentn + 4个字节Modules数量 + Module1 + ··· + Modulen 

例: 

```
Program {
    code: "4c49425241564d0a010007014a00000004000000034e000000060000000d54000000060000000e5a0000000600000005600000002900000004890000002000000008a90000000f00000000000001000200010300020002040200030204020300063c53454c463e0c4c696272614163636f756e74046d61696e0f7061795f66726f6d5f73656e6465720000000000000000000000000000000000000000000000000000000000000000000100020004000c000c0113010102",
    args: [{u64: 1}, {address: 4fddcee027aa66e4e144d44dd218a345fb5af505284cb03368b7739e92dd6b3c}],
    modules: [],
  } 
```



```
00000000b80000004c49425241564d0a010007014a00000004000000034e000000060000000d54000000060000000e5a0000000600000005600000002900000004890000002000000008a90000000f00000000000001000200010300020002040200030204020300063c53454c463e0c4c696272614163636f756e74046d61696e0f7061795f66726f6d5f73656e6465720000000000000000000000000000000000000000000000000000000000000000000100020004000c000c01130101020200000001000000200000004fddcee027aa66e4e144d44dd218a345fb5af505284cb03368b7739e92dd6b3c00000000405489000000000000000000
```

####2.WriteSet
类型
```
01000000
```

4个字节类型 + 4个字节WriteSet数量 + WriteSet1 + ··· + WriteSetn

###四、Raw_Transaction

4个字节发送人地址长度 + 发送人地址 + 8个字节Sequence数量 + Payload + 8个字节maxGasAmount + 8个字节gasUnitPrice + 8个字节expirationTime

例:

```
{
    sender: 65e39e2e6b90ac215ec79e2b84690421d7286e6684b0e8e08a0b25dec640d849,
    sequence_number: 0,
    payload: Program {
    code: "4c49425241564d0a010007014a00000004000000034e000000060000000d54000000060000000e5a0000000600000005600000002900000004890000002000000008a90000000f00000000000001000200010300020002040200030204020300063c53454c463e0c4c696272614163636f756e74046d61696e0f7061795f66726f6d5f73656e6465720000000000000000000000000000000000000000000000000000000000000000000100020004000c000c0113010102",
    args: [{u64: 9}, {address: 4fddcee027aa66e4e144d44dd218a345fb5af505284cb03368b7739e92dd6b3c}],
    modules: [],
  } ,
  max_gas_amount: 140000,
  gas_unit_price: 0,
  expiration_time: 0 seconds
}

```

```
2000000065e39e2e6b90ac215ec79e2b84690421d7286e6684b0e8e08a0b25dec640d849000000000000000000000000b80000004c49425241564d0a010007014a00000004000000034e000000060000000d54000000060000000e5a0000000600000005600000002900000004890000002000000008a90000000f00000000000001000200010300020002040200030204020300063c53454c463e0c4c696272614163636f756e74046d61696e0f7061795f66726f6d5f73656e6465720000000000000000000000000000000000000000000000000000000000000000000100020004000c000c01130101020200000001000000200000004fddcee027aa66e4e144d44dd218a345fb5af505284cb03368b7739e92dd6b3c00000000405489000000000000000000e02202000000000000000000000000000000000000000000
```
###五、Sign
####Sign过程

待签名字节流第一部分 Salt: 46f174df6ca8de5ad29745f91584bb913e7df8dd162e3e921a5c1d8637c88d16

待签名字节流第二部分: Raw_Transaction


sha3_256加密 -> ED25519算法签名 -> 签名后数据


未签名Raw_Transaction + 4个字节公钥长度 + 公钥 + 4个字节签名长度 + 签名
例:

```
{
    sender: b8c39fc6910816ad21bc2be4f7e804539e7529b7b7d188c80f093e1e61f192cf,
    sequence_number: 0,
    payload: Program {
    code: "4c49425241564d0a010007014a00000004000000034e000000060000000d54000000060000000e5a0000000600000005600000002900000004890000002000000008a90000000f00000000000001000200010300020002040200030204020300063c53454c463e0c4c696272614163636f756e74046d61696e0f7061795f66726f6d5f73656e6465720000000000000000000000000000000000000000000000000000000000000000000100020004000c000c0113010102",
    args: [{u64: 9}, {address: 4fddcee027aa66e4e144d44dd218a345fb5af505284cb03368b7739e92dd6b3c}],
    modules: [],
  } ,
  max_gas_amount: 140000,
  gas_unit_price: 0,
  expiration_time: 0 seconds
}

```


```

2aa80320000000b8c39fc6910816ad21bc2be4f7e804539e7529b7b7d188c80f093e1e61f192cf000000000000000000000000b80000004c49425241564d0a010007014a00000004000000034e000000060000000d54000000060000000e5a0000000600000005600000002900000004890000002000000008a90000000f00000000000001000200010300020002040200030204020300063c53454c463e0c4c696272614163636f756e74046d61696e0f7061795f66726f6d5f73656e6465720000000000000000000000000000000000000000000000000000000000000000000100020004000c000c01130101020200000001000000200000004fddcee027aa66e4e144d44dd218a345fb5af505284cb03368b7739e92dd6b3c00000000405489000000000000000000e022020000000000000000000000000000000000000000002000000035b91d2d8ffb743b208b83c15def3bcf68dad9f0a7174f6b6a52156db36c4144400000002cec5fd134657afe96846b6b7e5f575be5086bbbaf9edec71d136472ff1556a8ffff4a062e2d6e7725b6c338c240639c57d8c710660202154bed227d0d726a06
```

<!--

##交易拼接


###1.Argument
####U64 金额
类型: 4个字节 00000000   
长度:8个字节,不够前面补零后倒序输出
####Address 地址
类型: 4个字节 01000000   
长度:4个字节地址长度+地址,长度不够补零后倒序输出
####2.Program
前缀4个字节: Hex字符串00000000   
Code长度: 4个字节,不够前面补零后倒序输出   
追加Code数据   
追加Argument数量4个字节,不够前面补零后倒序输出   
追加Modules数量4个字节,不够前面补零后倒序输出   
module长度4个字节,不够前面补零后倒序输出   
追加module
####3.Raw_Transaction
发送地址长度4个字节,不够前面补零后倒序输出   
追加发送地址  
追加SequenceNumber长度8个字节,不够前面补零后倒序输出  
追加Program
追加MaxGasAmount长度8个字节,不够前面补零后倒序输出  
追加GasUnitPrice长度8个字节,不够前面补零后倒序输出   
追加ExpirationTime长度8个字节,不够前面补零后倒序输出
####4.签名

签名过程   
第一部分 Salt: 46f174df6ca8de5ad29745f91584bb913e7df8dd162e3e921a5c1d8637c88d16
第二部分: Raw_Transaction
sha3_256加密后带入ED25519算法签名得到签名后数据
####5.拼接最终交易
1.追加未签名Raw_Transaction   
2.追加公钥长度4个字节,不够前面补零后倒序输出   
3.追加公钥   
4.追加签名后数据4个字节长度,不够前面补零后倒序输出   
5.追加签名后数据
-->

