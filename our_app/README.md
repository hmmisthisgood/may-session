
- Fat apk : supports all CPU ABI 
```
flutter build apk 
```

- Splittted apk (3 types of CPU abi)
```bash
flutter build apk --split-per-abi
```


android app bundle (latest format to submit in play store)
.aab 

```
flutter build appbundle
```


### Creating signing key
```
  keytool -genkey -v \
  -keystore ./release-key.jks \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias release \
  -keypass password \
  -storepass password
```

#### getting the sha1 hash of the release key

```
keytool -list \
 -v \
-keystore ./may-release-key.jks \
-alias release \
-storepass password \
-keypass password

```
> Copy and add the sha1 hash to firebase console 
> For facebook, convert the sha1 hash to base64 using https://base64.guru/converter/encode/hex. 