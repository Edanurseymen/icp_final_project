# icp_final_project

Proje Raporu: E-Ticaret Faturalarının Blok Zincirinde Kesilip Kaydedilmesi
 Bu rapor, satıcıların ürün faturalarını takip etmelerine ve yönetmelerine olanak tanıyan bir Motoko dili projesi olan FaturaSistemi'ni tanıtmaktadır.
 FaturaSistemi, bir e-ticaret platformu veya mağaza sahiplerinin kullanabileceği bir sistemdir. Sisteme kayıtlı şirketler, ürünlerini ekleyebilir, faturalarını oluşturabilir ve müşterilerine sunabilirler. 
________________________________________
Proje Amaçları:
1.	Satıcıların ürün faturalarını istedikleri zaman görüntüleyebilecekleri bir sistem oluşturmak.
2.	Ürün kayıtlarının oluşturulması ve yönetilmesi.
3.	Şirketlerin kaydının alınması ve güncellenmesi.
4.	Kullanıcıların (satıcıların) kaydının alınması ve güncellenmesi.
5.	Fatura kesme işleminin gerçekleştirilmesi ve fatura bilgilerinin blok zincirine kaydedilmesi.
6.	Kullanıcıların faturalarını listeleme işleminin sağlanması.
7.	Belirli bir faturanın detaylarının getirilmesi işleminin gerçekleştirilmesi.
8.	Şirketlerin kendi özel ürünlerini tanımlayabilmesini sağlayan özel bir işlevsellik eklenmesi.
________________________________________
Proje Detayları:
1.	Ürün Kayıtlarının Oluşturulması:
•	Her bir ürünün genel bir veritabanında kaydedilmesi.
•	Bu veritabanı şirketlerden bağımsız olmalı, ortak ürünlerin tanımlanmasını sağlamalı.
2.	Şirketlerin Kaydı:
•	Yeni şirketlerin sisteme kaydedilmesi.
•	Var olan şirketlerin bilgilerinin güncellenmesi.
3.	Kullanıcı Kaydı (Satıcı Kaydı):
•	Yeni kullanıcıların (satıcıların) sisteme kaydedilmesi.
•	Var olan kullanıcıların bilgilerinin güncellenmesi.
4.	Fatura Kesme Metodu:
•	Bir şirketin veya satıcının, belirli bir müşteriye ait alışverişe dayalı fatura kesme işlemi.
•	Faturada şirket ID'si, ürünlerin ID'leri, satıcı ID'si, ve müşteri adı bilgilerinin bulunması.
5.	Kullanıcının Faturalarını Listeleme Metodu:
•	Bir kullanıcının (satıcının) sistemdeki tüm faturalarının listelenmesi.
6.	Belirli Bir Faturanın Detaylarını Getirme Metodu:
•	Bir kullanıcının (satıcının) sistemdeki bir faturasının detaylarının getirilmesi.
7.	Ürün Kayıtlarının Şirket Bazında Oluşturulması:
•	Şirketlerin kendi özel ürünlerini tanımlamasını sağlayan ek bir işlevsellik.
•	Bu işlevsellik sayesinde şirketler kendi ürünlerini sisteme kaydedebilir ve yönetebilir.
________________________________________
Öngörülen Katkılar:
•	Bu proje, e-ticaret işletmeleri için önemli bir araç olacak, çünkü fatura bilgilerinin blok zincirine kaydedilmesi, güvenilirlik ve şeffaflık sağlar.
•	Şirketlerin ve kullanıcıların bilgilerinin güncellenmesi ve kaydedilmesi için kolay ve kullanıcı dostu bir platform sunar.
•	Faturaların listelenmesi ve detaylarının görüntülenmesi işlemleri, işletmelerin alım-satım işlemlerini takip etmesini ve yönetmesini kolaylaştırır.
•	Şirketlerin veya satıcıların faturalarını zaman sınırı olmaksızın istediklerinde görüntülemelerine olanak sağlar.
________________________________________
Veri Yapıları ve Fonksiyonlar

Veri Yapıları
•	Company (Şirket): Şirketin kimliği (companyId) ve adını (companyName) içerir.
•	User (Kullanıcı): Kullanıcının kimliği (userId), adı (name) ve şifresini (password) içerir.
•	Product (Ürün): Ürünün kimliği (productId), ait olduğu şirketin kimliği (companyId), ürün adı (productName), markası (brand) ve fiyatını (price) içerir.
•	Invoice (Fatura): Faturanın kimliği (invoiceId), ait olduğu şirketin kimliği (companyId), satıcının kimliği (sellerId), müşterinin adı (customerName) ve fatura kalemlerinin kimliklerini (productIds) içerir.
________________________________________
 Fonksiyonlar
•	registerCompany(companyName: Text) : async Nat: Yeni bir şirket kaydı oluşturur ve kimliğini döndürür.
•	registerUser(userName: Text) : async Nat: Yeni bir kullanıcı kaydı oluşturur ve kimliğini döndürür.
•	createProduct(companyId: Nat, productName: Text, brand: Text, price: Nat) : async Nat: Yeni bir ürün kaydı oluşturur ve kimliğini döndürür.
•	createInvoice(companyId: Nat, productIds: [Nat], sellerId: Nat, customerName: Text) : async Nat: Yeni bir fatura oluşturur ve kimliğini döndürür.
•	listUserInvoices(userId: Nat) : async [Invoice]: Belirli bir kullanıcının tüm faturalarını listeler.
•	getInvoiceById(userId: Nat, invoiceId: Nat) : async ?Invoice: Belirli bir kullanıcının belirli bir faturasını getirir.
________________________________________
4. Çalışma Prensibi
1.	Şirket ve Kullanıcı Kaydı Alma: Şirketler ve kullanıcılar kayıt olabilir ve sisteme giriş yapabilirler.
2.	Ürün Kaydı Oluşturma: Şirketler ürünlerini sisteme ekleyebilirler.
3.	Fatura Oluşturma: Şirketler müşterilerine faturalar oluşturabilir ve gönderebilirler.
4.	Faturaları Listeleme: Kullanıcılar kendi faturalarını görüntüleyebilirler.
5.	Belirli Bir Faturayı Getirme: Kullanıcılar belirli bir faturayı kimliği ile bulabilirler.



