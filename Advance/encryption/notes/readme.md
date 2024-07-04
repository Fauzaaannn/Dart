# Quick Overview

https://pub.dev/packages/pointycastle 

- [Hashes](hashes.md)

- [Deriving Keys](deriving-keys.md)

- [Secure Random Numbers](secure-random-num.md)

- [Stream Ciphers](stream-ciphers.md)

- [Block Ciphers](block-ciphers.md)

## Block Ciphers: AES

A black ciphers such as **AES** which stands for *Advanced Encryption Standard*, is **extremely strong** encryption but it’s also **very slow**. That’s called a *Symmetrical Cipher* meaning both sides line up. 

## Asymmetric Block Ciphers: RSA

Asymmetric meaning both sides do not line up, have what are called public and private keys.

### The Difference

With Symmetric you have a **single key**. With Asymmetric, you have **two** keys, **a public and a private**

## Stream Ciphers: Salsa20

Stream Ciphers takes a stream of data and encrypts it as the stream flows through.

## Block Cipher modes of operation

- 'CBC' (Cipher Block Chaining mode)
- 'ECB' (Electronic Code Book mode)
- 'CFB-64' (Cipher Feedback mode, using blocks)
- 'GCTR' (GOST 28147 OFB counter mode, using blocks)
- 'OFB-64' (Output FeedBack mode, using blocks)
- 'CTR'/'SIC' (Counter mode, using blocks)
- 'IGE' (Infinite Garble Extension)
- **Authenticated block modes of operation**
    - 'GCM' (Galois-Counter mode)
    - 'CCM' (counter with CBC-MAC)

Pretty much one of the default is Cipher Block Chaining (CBC) but, Cipher Feedback Mode is also a pretty good one too.

## Paddings

This is use specifically for certain functions, such as Asymmetric Block Ciphers. You have to have a certain amount of padding in there

## Digests

What this does, this is called a one way hash. You take a data and you examine the data and you build a set of numbers based on that data. What this is good for is determining if the data has changed. 

- Example:
    - I want to download a file from My website, but I want to make sure that nobody’s tempered with the file since I last did it. I would make a one way hash. You would make the hash and you compare the two together to make sure they match up.

---

# Notes

Why the difference between the Block Ciphers and Stream Ciphers Algorithm ?

Why not use Salsa20 for everything? Why not use AES for everything? 

→ They are different algorithms for different circumstances

→ For Example Salsa20 is not as secure as AES, AES is more secure but takes a lot longer

→ Maybe on the screen (the example program) is lighting fast, but if you get a lot of data think like a database or something, it really starts impacting

→ Now with the jump in processing power and memory of modern day computers, it’s not as bad as hit, but when it was first developed, it was a pretty big hit. You could actually feel the computer getting slower when it used a AES.