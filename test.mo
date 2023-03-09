import Lib "mo:ed25519";

actor {

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
      let isValid = Lib.ED25519.verify(signature, message,publicKey);
      isValid;
    };
}