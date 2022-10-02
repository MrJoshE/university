# Week 1

## Types of Cryptography problems

### Ancient problems:

- Encryption
  
### Modern problems: 

- Encryption
- Detecting whether the information has been corrupted
- Digital rights management
- Data Authentication
- Access Control
- Privacy

## Encryption Specific Terminology

- Plaintext: The payload / message
- Ciphertext: Encrypted message
- Key: A secret value
- Encryption function: Process of obtaining cyphertext from plaintext and key
- Decryption function: Process of obtaining plaintext from ciphertext and key

## Types of Encryption

### Caesar Cipher

**How to do**
- Algorithm is: newIndex = (index of character in alphabet + shift) % 26

**How to break**
- Trying out the keys is the only way to break it. Pure brute force attacks. 
- As there are 25 unique transformations that each character can have performed on it, including 0 shifts there are 26 therefore there is 26! differnet possibilities.

### Substition Ciphers


**How to break**
- Frequency analysis
- Find the most frequent letters in the cyphertext and compare their frequency to the frequency of letters in the alphabet and find a correlation and start substituing.

### Vigenère

**How to do**
- Repeat the key for the length of the plain text
- Algorithm is: newIndex = (index of character of plaintext in alphabet + index of character of key in algorithm) % 26

**How to break**
- Find patterns and look at the offset between them
- Repeated patterns will lways be picked up as matches
- Plot the number of matches against offset. Obtain a graph.
- Look at the higher numbers of matches for offsets.
- The offset intervals may be of the same multiple.
- This can tell you key length as its repeating
- If guess is correct, all characters at the same position mod key length will be encrypted with the same character.
- Then do a frequency analysis 
- This obtains the key


### The one-time pad

**How to do**
- Generate random key the length of the plaintext message
- Pointwise addition of the plaintext and the key

### Vernam Cipher

**Using the same key 2 times**
Y1 ⊕Y2 = (X1 ⊕K)⊕(X2 ⊕K) = (X1 ⊕X2)⊕(K ⊕K) = X1 ⊕X2

## Laws of Modern Cryptography

### Law of Kerckhoffs Principle
- Security should not rely on the secrecy of the cryptosystem itself:
  - Motivation: 
    - The adversart may get some information about the system 
  - Meaning:
    - Security analysis must assume that the adversary knows the cryptosystem
  - Does not mean
    - Cryptosystem must be public

### Law of n^2 problem
- In a network of n users, there is a number of potential paris of users within the order of magnitude of n^2
  - We cannot assume that every pair of users share a secret key
  - We must find a way for any pair of users to establish a shared secret key

### Moores Law
- Speed of CPUs doubles every 18 months
  - We should wonder how long a system must remain secure
  - We must estimate the speed of CPU at the end of this period
  - We assess security against brute force attacks

### Murphy's Law
- If there is a single security hole, the system will fall into it
  - Never leave a security hole
  - Don't bet on a security, rather prove it.

## Perfect Secrecy

- Perfect Secrecy means that the posterior distribrution of the plaintext X after we know the ciphertext Y is equal to the prior distribution of the plaintext
- 'The adversary learns nothing about X by intercepting Y'
- X = plaintext
- Y = cyphertext1

### Vernam Cipher Provides Perfect Secrecy

- Theorem
  - For any distribution of the plaintext, the generalized Vernam cipher provides perfect secrecy.

## Summary
Summary on “Old” cryptography
• Caeser cipher: a simple substitution (the key is the offset) • Subject to brute force attacks
• Substitution cipher: permutation of letters • Subject to frequency analysis
• Vigenère: keystream generated from keyword
• Correlation + frequency analysis: exploiting patterns
• Enigma: a good attempt at a non-repeating keystream (but not close enough) • One time pad
• Perfectly secure.
• In practice highly impractical. Key generation is expensive, and key management and distribution is difficult.

## Summary of Security Requirements
the key must have (at least) the same length of the message the key must be uniformly distributed
the key must be thrown away after usage
􏰇: this makes no sense for most of applications! 􏰈: this provides perfect security
makes sense to prepare emergency communication (red telephone)
keys are exchanged (through slow channels) before the messages to transmit are known
bad news for other application: there is essentially no better cipher with this strong security property

## Overall Summary
• Designing a good cryptosystem is hard. Just because you can’t see how to crack it, doesn’t mean someone else won’t.
• Cryptosystems may exhibit patterns that allow them to be cracked.
• Language has patterns which can be exploited.
• Keys need to be large enough to withstand brute force attacks (by computers).
• Long random one-use-only keystreams (the length of the message) avoid the above problems. But key management becomes an issue.