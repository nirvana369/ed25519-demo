import Lib "mo:ed25519";
import Crypto "mo:motoko-sha2";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Blob "mo:base/Blob";

actor {

    // random test

    public func generatePrivateKey() : async Text {
      let privateKey = Lib.Utils.randomPrivateKey();
      Lib.Utils.bytesToHex(privateKey);
    };

    public func generatePubKey() : async Text {
      let privateKey = Lib.Utils.randomPrivateKey();
      let message : [Nat8] = [0xab, 0xbc, 0xcd, 0xde];
      let publicKey = Lib.ED25519.getPublicKey(privateKey);
      Lib.Utils.bytesToHex(publicKey);
    };

    public func sign() : async Text {
      let privateKey = Lib.Utils.randomPrivateKey();
      // let privateKey : [Nat8] = [0xde, 0xad, 0xbe, 0xef];
      let message : [Nat8] = [0xab, 0xbc, 0xcd, 0xde];
      let publicKey = Lib.ED25519.getPublicKey(privateKey);
      let signature = Lib.ED25519.sign(message, privateKey);
      Lib.Utils.bytesToHex(signature);
    };

    public func valid() : async Bool {
      let privateKey = Lib.Utils.randomPrivateKey();
      let message : [Nat8] = [0xab, 0xbc, 0xcd, 0xde];
      let publicKey = Lib.ED25519.getPublicKey(privateKey);
      let signature = Lib.ED25519.sign(message, privateKey);
      let isValid = Lib.ED25519.verify(signature, message, publicKey);
      isValid;
    };

    /// manual test

    public func keyFromSeed(seed : Text) : async {privateKey : Text; publicKey : Text} {
      let privKey = Blob.toArray(Crypto.fromBlob(#sha256, Text.encodeUtf8(seed)));

      let pubKey = Lib.ED25519.getPublicKey(privKey);
      
      {privateKey = Lib.Utils.bytesToHex(privKey); 
      publicKey = Lib.Utils.bytesToHex(pubKey)};
    };

    public func signMessage(seed : Text, message : Text) : async {privateKey : Text; signature : Text} {
      let privKey = Crypto.fromBlob(#sha256, Text.encodeUtf8(seed));
      let msgHash512 = Crypto.fromBlob(#sha512, Text.encodeUtf8(message));
      let signature = Lib.ED25519.sign(Blob.toArray(msgHash512), Blob.toArray(privKey));
      {privateKey = Lib.Utils.bytesToHex(Blob.toArray(privKey)); 
      signature = Lib.Utils.bytesToHex(signature)};
    };

    public func verifyByPrivKey(privateKey : Text, signature : Text, message : Text) : async Bool {
      let privKey = Lib.Utils.hexToBytes(privateKey);
      let publicKey = Lib.ED25519.getPublicKey(privKey);
      let msgHash512 = Blob.toArray(Crypto.fromBlob(#sha512, Text.encodeUtf8(message)));
      let isValid = Lib.ED25519.verify(Lib.Utils.hexToBytes(signature), msgHash512, publicKey);
      isValid;
    };

    public func verifyByPubKey(publicKey : Text, signature : Text, message : Text) : async Bool {
      let msgHash512 = Blob.toArray(Crypto.fromBlob(#sha512, Text.encodeUtf8(message)));
      let isValid = Lib.ED25519.verify(Lib.Utils.hexToBytes(signature), msgHash512, Lib.Utils.hexToBytes(publicKey));
      isValid;
    };

    // Error: exceeded the instruction limit for single message execution.
    public func verify(seed : Text, message : Text) : async Bool {
      let privKey = Blob.toArray(Crypto.fromBlob(#sha256, Text.encodeUtf8(seed)));
      let pubKey = Lib.ED25519.getPublicKey(privKey);
      let msgHash512 = Blob.toArray(Crypto.fromBlob(#sha512, Text.encodeUtf8(message)));

      let publicKey = Lib.ED25519.getPublicKey(privKey);
      let signature = Lib.ED25519.sign(msgHash512, privKey);
      let isValid = Lib.ED25519.verify(signature, msgHash512, publicKey);
      isValid;
    };
}