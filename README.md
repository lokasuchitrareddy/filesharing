# filesharing(Acadamic Project)

https://github.com/lokasuchitrareddy/filesharing/assets/140941286/83dbd393-3764-4371-aef8-21579d54eea6


https://github.com/lokasuchitrareddy/filesharing/assets/140941286/f3f730b7-376a-4b48-b757-0dd4c99d259a




In cloud solutions like Google's G-Suite and Microsoft OneDrive for Business, teams can work together on documents and talk in real-time.
These apps sync files across everyone's devices, so everyone has the latest version. This is great for teams working on projects together.
But there's a question about how safe the cloud is. Storing data online can expose it to hackers and mistakes made by users. 
Surprisingly, the biggest risk often comes from mistakes made by people inside the company, not external threats. 
They might accidentally share files or give out passwords without knowing.
To keep things safer, we use something called secure file sharing. This way, only the right people can get to the files. 
The files are kept in the cloud, which means any computer viruses won't hurt them. 
We can make it even safer by using two special methods: RSA and AES.
RSA helps with sharing secret codes to open the files. Only the right people can unlock them using their special keys. 
AES is like a lock that only works with a special key, but it's used to keep the files themselves safe.
So, in simple words, cloud tools help us work together, but we need to be careful. 
Secure file sharing with RSA and AES keeps our stuff safe, even if there are mistakes or hackers around.

Data owner:
The data owner encrypts his/her data with a symmetric encryption algorithm like
AES then the data owner encrypts the symmetric key under the RSA algorithm. After
that, the owner sends the whole encrypted data and the encrypted symmetric key (denoted
as ciphertext CT) to the cloud server to be stored in the cloud.

Data User:
The user can freely get any interested encrypted data from the cloud server.
However, the user can decrypt the encrypted data with his/her private key if and only if
that encrypted data is encrypted by his/her public key, otherwise they cannot access it.

Project Environment :
IDE : Eclipse
Database : Mysql
Languages/Frameworks:Core Java,JSP,HTML5,CSS3,Java Script, Bootstrap
Webserver : Apache Tomcat

