library poseidon;

import 'constants/p1.dart';
import 'constants/p2.dart';
import 'constants/p3.dart';
import 'constants/p4.dart';
import 'constants/p5.dart';
import 'constants/p6.dart';
import 'constants/p7.dart';
import 'constants/p8.dart';
import 'constants/p9.dart';
import 'constants/p10.dart';
import 'constants/p11.dart';
import 'constants/p12.dart';
import 'constants/p13.dart';
import 'constants/p14.dart';
import 'constants/p15.dart';
import 'constants/p16.dart';

const poseidonNumToHashFN = [
  poseidon1,
  poseidon2,
  poseidon3,
  poseidon4,
  poseidon5,
  poseidon6,
  poseidon7,
  poseidon8,
  poseidon9,
  poseidon10,
  poseidon11,
  poseidon12,
  poseidon13,
  poseidon14,
  poseidon15,
  poseidon16,
];

BigInt poseidonHash(List<BigInt> inputs) {
  try {
    if (inputs.length <= poseidonNumToHashFN.length) {
      Function hashFN = poseidonNumToHashFN[inputs.length - 1];
      return hashFN(inputs);
    } else if (inputs.length <= 32) {
      List<BigInt> hash1 = inputs.sublist(0, 16);
      List<BigInt> hash2 = inputs.sublist(16);
      return poseidonHash([poseidonHash(hash1), poseidonHash(hash2)]);
    } else {
      throw Exception(
          'Yet to implement: Unable to hash a vector of length ${inputs.length}');
    }
  } catch (e) {
    throw Exception('poseidonHash error: $e');
  }
}
