# ed25519-demo
Motoko demo ed25519

Thuật toán Ed25519 sử dụng cặp khóa public và private để thực hiện việc ký và xác thực chữ ký số. Kích thước của cặp khóa này là 256-bit, tương đương với 32 byte. Cụ thể, private key có độ dài là 32 byte và public key có độ dài là 32 byte.

Trong thuật toán Ed25519, để tạo ra chữ ký số hợp lệ, message cần phải được mã hóa bằng cách sử dụng một hàm băm (hash function) trước khi ký. Cụ thể, Ed25519 sử dụng hàm băm SHA-512 để băm message trước khi ký.

Một message hợp lệ để ký bằng Ed25519 là một chuỗi byte có độ dài bất kỳ và được băm bằng SHA-512 để tạo ra một hash value có độ dài là 64 byte. Sau đó, chữ ký số sẽ được tạo ra bằng cách sử dụng private key của người ký và hash value của message này.

Chú ý rằng, nếu message không được băm trước khi ký hoặc không đủ dài để tạo ra hash value có độ dài 64 byte, chữ ký số sẽ không hợp lệ và không thể được sử dụng để xác thực.

-------------------------------------------------------------------------------------------------------------------------------

Ed25519 và ECDSA (Elliptic Curve Digital Signature Algorithm) là hai thuật toán chữ ký số dựa trên đường cong elliptic (elliptic curve cryptography - ECC). Tuy nhiên, chúng có những điểm khác nhau sau:

1. Kích thước khóa: Ed25519 sử dụng khóa 256 bit, trong khi ECDSA sử dụng khóa 256, 384 hoặc 521 bit.

2. Độ bảo mật: Ed25519 được cho là cung cấp độ bảo mật tương đương với ECDSA với khóa 3072 bit, trong khi đó, ECDSA với khóa 256 bit được coi là cung cấp độ bảo mật tương đương với Ed25519.

3. Tốc độ: Ed25519 nhanh hơn ECDSA. Với cùng một cấp độ bảo mật, Ed25519 có thể ký và xác thực chữ ký nhanh hơn nhiều so với ECDSA.

4. Hàm băm: Ed25519 sử dụng hàm băm SHA-512 để băm message trước khi ký, trong khi ECDSA sử dụng nhiều hàm băm khác nhau như SHA-1, SHA-256 hoặc SHA-3.

5. Bảo mật chống lại các cuộc tấn công: Ed25519 được thiết kế để chống lại các cuộc tấn công mới như các cuộc tấn công bằng cách sử dụng các khóa yếu và lỗ hổng bảo mật khác, trong khi ECDSA có thể bị tấn công bằng một số kỹ thuật mới như cuộc tấn công bên cạnh (side-channel attack).

Tóm lại, Ed25519 và ECDSA đều là các thuật toán chữ ký số dựa trên đường cong elliptic, tuy nhiên, Ed25519 có nhiều ưu điểm vượt trội về tốc độ và bảo mật, trong khi ECDSA có thể được sử dụng trong nhiều trường hợp vì nó có thể được triển khai với nhiều kích thước khóa khác nhau.

---------------------------------------------------------------------------------------------------------------------------------
Ưu điểm vượt trội về tốc độ và bảo mật:

1. Ed25519 sử dụng đường cong elliptic có đặc tính đối xứng đơn giản (twisted Edwards curve), giúp cho việc tính toán trên đường cong này nhanh hơn so với các đường cong khác, như đường cong Weierstrass sử dụng trong ECDSA.

2. Ed25519 sử dụng phép nhân scalar (scalar multiplication) dựa trên phép cộng (addition) để tính toán chữ ký số, giúp cho tính toán trở nên đơn giản hơn và nhanh hơn so với phép nhân scalar dựa trên phép nhân (multiplication) trong ECDSA.

3. Ed25519 sử dụng hàm băm SHA-512 để băm message trước khi ký, cung cấp độ bảo mật tốt hơn so với các hàm băm khác như SHA-1 hoặc SHA-256 sử dụng trong ECDSA.

4. Ed25519 được thiết kế để tránh các lỗ hổng bảo mật tiềm ẩn như các vấn đề liên quan đến khóa nhưng không phải lỗ hổng khóa (key-space attacks) và các cuộc tấn công bên cạnh (side-channel attacks).

5. Ed25519 được thiết kế để có thể triển khai trên nhiều nền tảng khác nhau với hiệu suất tối ưu và khả năng sử dụng trong các ứng dụng có tài nguyên hạn chế như các thiết bị di động hay các thiết bị Internet of Things.

Tóm lại, các yếu tố kết hợp như đường cong elliptic đối xứng đơn giản, phép nhân scalar dựa trên phép cộng, hàm băm SHA-512, thiết kế chống lại các lỗ hổng bảo mật tiềm ẩn và tính di động tối ưu đã giúp cho Ed25519 có nhiều ưu điểm vượt trội về tốc độ và bảo mật.