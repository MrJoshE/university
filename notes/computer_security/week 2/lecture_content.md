# Symmetric and Asymmetric Cryptography

## Definitions
- Symmetric cryptography: A single key is used in different cryptographic operations
  - Taking encryption / decryption as an example, the same key is used in both encryption and decryption algorithms
  - Symmetric cryptography is also called secret key cryptography
- Asymmetric cryptography: a pair of related keys are used in different cryptographic operations
  - One key is public and another key is kept secret
  - Taking encryption / decryption as an example, the public key is used for encryption and the secret key is used for decryption
  - Asymmetric cryptography is also called public key cryptography

## Symmetric Cryptography

### From one time pad to modern cryptography

- One time pad is a symmetric cryptographic encryption scheme
- One time pad: the length of a key is the same as the length of ta plaintext to be encrypted, and the key cannot be re-used
- Modern cryptography: the length of a key is independent to the size of a plaintext, and the key can be re-used.

### Stream Cipher and Block Cipher
- Stream cipher: Symmetric encryption system with the property that the encryption algorithm  involves combining a sequence of plaintext symbols with a sequence of keystream symbols one symbol at a time, using an invertible function
- Bloc cipher: symmetric encipherment system with the property that the encryption algorithm operates on a block of plaintext, i.e a string of bits of a defined length, to yield a block of ciphertext.

### Block Cyphers
- Encryption and Decryption
  - Takes a block of a certain size (known as the block size)
  - And a key of a certain length
  - And returns another block of the same size
  - The same key is used for encryption and decryption. This means a block cipher is symmetric.

Two Block Cipher Examples: DES (Data Encryption Standard) and AES (Advanced Encryption Standart)

DES:
- Takes a certain size (64 bits = 8 bytes = 16 hex digits)
- and a key of certain length (56 bits [in fact 64 bits are provided but 8 are used as a checksum])
- and returns another block of the same size (64 bits)

AES:
- Takes a block of a certain size (128 bits = 16 bytes = 32 hex digits)
- And a key of certain length (128, 192, 256)
- And returns another block of the same size (128 bits)

Encrypting with DES:

For example: Encrypting ATOM with DES
- Atom as bytes = 41746F6D
- Key = A5636D43433D2B
- Atom does not give a full 64 bit block...

What to do when the plaintext does not give an exact number of blocks?: 
- Padding
- It will need to be extended to produce a file of the right size: an exact number of 64 bit blocks (when using DES). This will require adding additional bytes, known as padding
- This needs to be done in a recognisable way so the padding can be removed on decryption

Several padding schemes for a given block size:
- Zero padding: Add zero bytes to complete the block
- ANSI X.923: add a sequence of 0's with the number of added bytes as the last byte
- PKCS7: identify how many bytes to add, and add a sequence of bytes all containing that number
- PKCS5: same as PKCS7 (sometime) only for 8-byte block size

- Zero padding should not be used if bytes in the block can have the value 00.

What do you do when encrypting with DES produces more than a full 64 bit block?
- Use modes of operation

What are modes of operation?:
- How do we encruypt a sequence of blocks
- Block ciphers, can be used in a number of different ways to encrypt a data string (which consists of a number of blocks)
- A number of **modes of operation** have been recommended for using block ciphers for data encryption
- We will introduce three of them in details: Electronic Codebook Mode (ECB), Cipher Block Chaining Mode (CBC) and Counter mode (CTR)
- Several more will be mentioned for you to learn them by yourselves.

Electronic Codebook Mode (ECB)
- ECB is the most basic mode.
- In ECB, a data string is split into blocks, and each block is seperately encrypted, to provide the output string.
- It uses the block cipher as a large substitution cipher, with no links between the blocks.
- The key gives rise to an 'electronic code book'
- Blocks are encrypted and decrypted independently
- For a given key, the same bock always encrypts to the same block

More about ECB:
- Encryption
  - Pad to an exact number of blocks
  - Use the encryption algorithm to encrypt each block in turn with the key
- Decryption
  - Use the decryption algorithm to decrypt each block in turn with the key 
  - Remove the padding 
  - 