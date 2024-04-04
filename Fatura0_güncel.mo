import Trie "mo:stdlib/trie";
import Random "mo:base/Random";
import Result "mo:base/Result";
import Text "mo:base/Text";
import Company "mo:company"; // Company actor arayüzü
import Product "mo:product"; // Product actor arayüzü

actor Company {

  // Şirket veri yapısı
  type Company = record {
    id : Nat;
    name : Text;
    address : Text;
  };

  // Şirketleri depolamak için Trie
  var company_trie : Trie.Trie<Nat, Company> = Trie.empty();

  // Yeni bir şirket kaydı oluşturur
  public func create_company(name : Text, address : Text) : async Nat {
    // Benzersiz bir şirket ID'si oluştur
    let id = await generate_id();

    // Yeni şirket kaydını oluştur
    let new_company = record {
      id = id;
      name = name;
      address = address;
    };

    // Şirket kaydını Trie'ye ekle
    company_trie := Trie.insert(company_trie, id, new_company);

    // Şirket ID'sini döndür
    return id;
  };

 // Şirket kaydı oluşturma fonksiyonu
  public func create_company(name : Text, address : Text) : async Nat {
    let new_id = await generate_id();
    let new_company = { id = new_id; name = name; address = address };
    company_trie := Trie.insert(company_trie, new_id, new_company);
    return new_id;
  };
 
  // ID'ye göre şirket bilgisi getirme fonksiyonu
  public func get_company_by_id(id : Nat) : async ?Company {
    return Trie.find(company_trie, id);
  };

  // Şirket bilgisini güncelleme fonksiyonu
  public func update_company(id : Nat, name : Text, address : Text) : async Bool {
    let company_opt = Trie.find(company_trie, id);
    switch(company_opt) {
      case null {
        // Şirket bulunamadı
        return false;
      }
      case (?company) {
        // Şirket bulundu, güncelle
        let updated_company = { id = id; name = name; address = address };
        company_trie := Trie.insert(company_trie, id, updated_company);
        return true;
      };
    };
  };

  // Şirket kaydını silme fonksiyonu
  public func delete_company(id : Nat) : async Bool {
    let company_opt = Trie.find(company_trie, id);
    switch(company_opt) {
      case null {
        // Şirket bulunamadı
        return false;
      }
      case (?company) {
        // Şirket bulundu, sil
        company_trie := Trie.remove(company_trie, id);
        return true;
      };
    };
  };
};
};

// Rastgele ID oluşturma fonksiyonu (company.mo dosyasının dışında tanımlanabilir)
func generate_id() : async Nat {
  return Random.nat_range(1, 1_000_000); // 1 ile 1 milyon arasında rastgele bir sayı üret

actor Product {

  // Ürün veri yapısı
  type Product = record {
    id : Nat;
    company_id : Nat;
    name : Text;
    brand : Text;
    price : Nat;
  };

  // Ürünleri depolamak için Trie
  var product_trie : Trie.Trie<Nat, Product> = Trie.empty();
  
  // Rastgele ID oluşturma fonksiyonu (yardımcı fonksiyon)
  func generate_id() : async Nat {
    return Random.nat_range(1, 1_000_000); // 1 ile 1 milyon arasında rastgele bir sayı üret
  };

  // Yeni ürün kaydı oluşturma fonksiyonu
  public func create_product(company_id : Nat, name : Text, brand : Text, price : Nat) : async Nat {
    let new_product_id = await generate_id();
    let new_product = { id = new_product_id; company_id = company_id; name = name; brand = brand; price = price };
    product_trie := Trie.insert(product_trie, new_product_id, new_product);
    return new_product_id;
  };

  // ID'ye göre ürün bilgisini getirme fonksiyonu
  public func get_product_by_id(id : Nat) : async ?Product {
    return Trie.find(product_trie, id); 
  };

  // Ürün bilgisini güncelleme fonksiyonu
  public func update_product(id : Nat, company_id : Nat, name : Text, brand : Text, price : Nat) : async Bool {
    let product_opt = Trie.find(product_trie, id);
    switch(product_opt) {
      case null {
        // Ürün bulunamadı
        return false;
      }
      case (?product) {
        // Ürün bulundu, güncelle
        let updated_product = { id = id; company_id = company_id; name = name; brand = brand; price = price };
        product_trie := Trie.insert(product_trie, id, updated_product);
        return true;
      };
    };
  };

  // Ürün kaydını silme fonksiyonu
  public func delete_product(id : Nat) : async Bool {
    let product_opt = Trie.find(product_trie, id);
    switch(product_opt) {
      case null {
        // Ürün bulunamadı
        return false;
      }
      case (?product) {
        // Ürün bulundu, sil
        product_trie := Trie.remove(product_trie, id);
        return true;
      };
    };
  };
};

actor User {

  // Kullanıcı veri yapısı
  type User = record {
    id : Nat;
    name : Text;
    password: Text;
  };

  // Kullanıcıları depolamak için Trie
  var user_trie : Trie.Trie

  // Kullanıcı kaydı oluşturma fonksiyonu
  public func create_user(name : Text, ...) : async Nat {
    let new_user_id = await generate_id();
    let new_user = { id = new_user_id; user_id = user_id; name = name; password = password; };
    user_trie := Trie.insert(user_trie,  new_user_id, new_user);
    return new_id;
  };

  // ID'ye göre kullanıcı bilgisi getirme fonksiyonu
  public func get_user_by_id(id : Nat) : async ?User {
    return Trie.find(user_trie, id);
  };

  // Kullanıcı bilgisini güncelleme fonksiyonu
  public func update_user(id : Nat, name : Text, password: Text;) : async Bool {
    let user_opt = Trie.find(user_trie, id);
    switch(user_opt) {
      case null {
        // Kullanıcı bulunamadı
        return false;
      }
      case (?user) {
        // Kullanıcı bulundu, güncelle
        let updated_user = { id = id; name = name; password = password;}; 
        user_trie := Trie.insert(user_trie, id, updated_user);
        return true;
      };
    };
  };

  // Kullanıcı kaydını silme fonksiyonu
  public func delete_user(id : Nat) : async Bool {
    let user_opt = Trie.find(user_trie, id);
    switch(user_opt) {
      case null {
        // Kullanıcı bulunamadı
        return false;
      }
      case (?user) {
        // Kullanıcı bulundu, sil
        user_trie := Trie.remove(user_trie, id);
        return true;
      };
    };
  };
};
func get_user_by_id(id : Nat) : async Result<User, Text> {  //kulanıcı bulunamadı uyarısı
  let user_opt = Trie.find(user_trie, id);
  switch(user_opt) {
    case null {
      return Err("Kullanıcı bulunamadı");
    }
    case (?user) {
      return Ok(user);
    };
  };
};

actor Invoice {
  // Fatura veri yapısı
  type Invoice = record {
    id : Nat;
    company_id : Nat;
    product_ids : vec Nat;
    seller_id : Nat;
    customer_name : Text;
  };

  // Faturaları depolamak için Trie
  var invoice_trie : Trie.Trie

  // Fatura oluşturma fonksiyonu
  public func create_invoice(company_id : Nat, product_ids : vec Nat, seller_id : Nat, customer_name : Text) : async Nat {
    let new_id = // ... (Rastgele ID oluşturma işlemi)
    let new_invoice = { id = new_id; company_id = company_id; product_ids = product_ids; seller_id = seller_id; customer_name = customer_name };
    invoice_trie := Trie.insert(invoice_trie, new_id, new_invoice);
    return new_id;
  };

  // ID'ye göre fatura bilgisi getirme fonksiyonu
  public func get_invoice_by_id(id : Nat) : async ?Invoice {
    return Trie.find(invoice_trie, id);
  };

import Trie "mo:stdlib/trie";
import Random "mo:base/Random";
import Result "mo:base/Result";
import Text "mo:base/Text";
import Company "mo:company"; // Company actor arayüzü
import Product "mo:product"; // Product actor arayüzü

actor Company {

  // Şirket veri yapısı
  type Company = record {
    id : Nat;
    name : Text;
    address : Text;
  };

  // Şirketleri depolamak için Trie
  var company_trie : Trie.Trie<Nat, Company> = Trie.empty();

  // Yeni bir şirket kaydı oluşturur
  public func create_company(name : Text, address : Text) : async Nat {
    // Benzersiz bir şirket ID'si oluştur
    let id = await generate_id();

    // Yeni şirket kaydını oluştur
    let new_company = record {
      id = id;
      name = name;
      address = address;
    };

    // Şirket kaydını Trie'ye ekle
    company_trie := Trie.insert(company_trie, id, new_company);

    // Şirket ID'sini döndür
    return id;
  };

 // Şirket kaydı oluşturma fonksiyonu
  public func create_company(name : Text, address : Text) : async Nat {
    let new_id = await generate_id();
    let new_company = { id = new_id; name = name; address = address };
    company_trie := Trie.insert(company_trie, new_id, new_company);
    return new_id;
  };
 
  // ID'ye göre şirket bilgisi getirme fonksiyonu
  public func get_company_by_id(id : Nat) : async ?Company {
    return Trie.find(company_trie, id);
  };

  // Şirket bilgisini güncelleme fonksiyonu
  public func update_company(id : Nat, name : Text, address : Text) : async Bool {
    let company_opt = Trie.find(company_trie, id);
    switch(company_opt) {
      case null {
        // Şirket bulunamadı
        return false;
      }
      case (?company) {
        // Şirket bulundu, güncelle
        let updated_company = { id = id; name = name; address = address };
        company_trie := Trie.insert(company_trie, id, updated_company);
        return true;
      };
    };
  };

  // Şirket kaydını silme fonksiyonu
  public func delete_company(id : Nat) : async Bool {
    let company_opt = Trie.find(company_trie, id);
    switch(company_opt) {
      case null {
        // Şirket bulunamadı
        return false;
      }
      case (?company) {
        // Şirket bulundu, sil
        company_trie := Trie.remove(company_trie, id);
        return true;
      };
    };
  };
};
};

// Rastgele ID oluşturma fonksiyonu (company.mo dosyasının dışında tanımlanabilir)
func generate_id() : async Nat {
  return Random.nat_range(1, 1_000_000); // 1 ile 1 milyon arasında rastgele bir sayı üret

actor Product {

  // Ürün veri yapısı
  type Product = record {
    id : Nat;
    company_id : Nat;
    name : Text;
    brand : Text;
    price : Nat;
  };

  // Ürünleri depolamak için Trie
  var product_trie : Trie.Trie<Nat, Product> = Trie.empty();
  
  // Rastgele ID oluşturma fonksiyonu (yardımcı fonksiyon)
  func generate_id() : async Nat {
    return Random.nat_range(1, 1_000_000); // 1 ile 1 milyon arasında rastgele bir sayı üret
  };

  // Yeni ürün kaydı oluşturma fonksiyonu
  public func create_product(company_id : Nat, name : Text, brand : Text, price : Nat) : async Nat {
    let new_product_id = await generate_id();
    let new_product = { id = new_product_id; company_id = company_id; name = name; brand = brand; price = price };
    product_trie := Trie.insert(product_trie, new_product_id, new_product);
    return new_product_id;
  };

  // ID'ye göre ürün bilgisini getirme fonksiyonu
  public func get_product_by_id(id : Nat) : async ?Product {
    return Trie.find(product_trie, id); 
  };

  // Ürün bilgisini güncelleme fonksiyonu
  public func update_product(id : Nat, company_id : Nat, name : Text, brand : Text, price : Nat) : async Bool {
    let product_opt = Trie.find(product_trie, id);
    switch(product_opt) {
      case null {
        // Ürün bulunamadı
        return false;
      }
      case (?product) {
        // Ürün bulundu, güncelle
        let updated_product = { id = id; company_id = company_id; name = name; brand = brand; price = price };
        product_trie := Trie.insert(product_trie, id, updated_product);
        return true;
      };
    };
  };

  // Ürün kaydını silme fonksiyonu
  public func delete_product(id : Nat) : async Bool {
    let product_opt = Trie.find(product_trie, id);
    switch(product_opt) {
      case null {
        // Ürün bulunamadı
        return false;
      }
      case (?product) {
        // Ürün bulundu, sil
        product_trie := Trie.remove(product_trie, id);
        return true;
      };
    };
  };
};

actor User {

  // Kullanıcı veri yapısı
  type User = record {
    id : Nat;
    name : Text;
    password: Text;
  };

  // Kullanıcıları depolamak için Trie
  var user_trie : Trie.Trie

  // Kullanıcı kaydı oluşturma fonksiyonu
  public func create_user(name : Text, ...) : async Nat {
    let new_user_id = await generate_id();
    let new_user = { id = new_user_id; user_id = user_id; name = name; password = password; };
    user_trie := Trie.insert(user_trie,  new_user_id, new_user);
    return new_id;
  };

  // ID'ye göre kullanıcı bilgisi getirme fonksiyonu
  public func get_user_by_id(id : Nat) : async ?User {
    return Trie.find(user_trie, id);
  };

  // Kullanıcı bilgisini güncelleme fonksiyonu
  public func update_user(id : Nat, name : Text, password: Text;) : async Bool {
    let user_opt = Trie.find(user_trie, id);
    switch(user_opt) {
      case null {
        // Kullanıcı bulunamadı
        return false;
      }
      case (?user) {
        // Kullanıcı bulundu, güncelle
        let updated_user = { id = id; name = name; password = password;}; 
        user_trie := Trie.insert(user_trie, id, updated_user);
        return true;
      };
    };
  };

  // Kullanıcı kaydını silme fonksiyonu
  public func delete_user(id : Nat) : async Bool {
    let user_opt = Trie.find(user_trie, id);
    switch(user_opt) {
      case null {
        // Kullanıcı bulunamadı
        return false;
      }
      case (?user) {
        // Kullanıcı bulundu, sil
        user_trie := Trie.remove(user_trie, id);
        return true;
      };
    };
  };
};
func get_user_by_id(id : Nat) : async Result<User, Text> {  //kulanıcı bulunamadı uyarısı
  let user_opt = Trie.find(user_trie, id);
  switch(user_opt) {
    case null {
      return Err("Kullanıcı bulunamadı");
    }
    case (?user) {
      return Ok(user);
    };
  };
};

actor Invoice {
  // Fatura veri yapısı
type Invoice = record {
  id : Nat;                // Fatura ID
  company_id : Nat;       // Şirket ID
  product_ids : List(Nat); // Ürün ID'leri listesi
  seller_id : Nat;         // Satıcı ID
  customer_name : Text;    // Müşteri adı
};

  // Faturaları depolamak için Trie
  var invoice_trie : Trie.Trie

  // Fatura oluşturma fonksiyonu
  public func create_invoice(company_id : Nat, product_ids : vec Nat, seller_id : Nat, customer_name : Text) : async Nat {
    let new_id = // ... (Rastgele ID oluşturma işlemi)
    let new_invoice = { id = new_id; company_id = company_id; product_ids = product_ids; seller_id = seller_id; customer_name = customer_name };
    invoice_trie := Trie.insert(invoice_trie, new_id, new_invoice);
    return new_id;
  };

  // ID'ye göre fatura bilgisi getirme fonksiyonu
  public func get_invoice_by_id(id : Nat) : async ?Invoice {
    return Trie.find(invoice_trie, id);
  };

 stable var invoices : List(Invoice) = [];  // Fatura listesini depolamak için bir değişken

//fatura güncelleme
  public func update_invoice(id : Nat, company_id : Nat, product_ids : List(Nat), seller_id : Nat, customer_name : Text) : async Result<(), Text> {
    let index = invoices.findIndex(|invoice| invoice.id == id);
    if (index == null) {
      return Err("Fatura bulunamadı.");
    } else {
      let updated_invoice = Invoice {
        id = id,
        company_id = company_id,
        product_ids = product_ids,
        seller_id = seller_id,
        customer_name = customer_name,
      };
      invoices[index] := updated_invoice;
      return Ok(());
    };
  };
// Fatura listeleme fonksiyonu
public func list_invoices(seller_id: Nat) : async Result<vec Invoice, Text> {
  let invoices = Trie.fold(invoice_trie, [], (acc, id, invoice) => {
    if (invoice.seller_id == seller_id) {
      acc # [invoice];
    } else {
      acc;
    };
  });
  if (Array.length(invoices) == 0) {
    return Err("Fatura bulunamadı.");
  } else {
    return Ok(invoices);
  };
};
//şirket ve satıcıya göre filtreleme
  public func filter_invoices(company_id : ?Nat, seller_id : ?Nat) : async List(Invoice) {
    return invoices.filter(|invoice| {
      let company_match = match company_id {
        null => true,
        (?cid) => invoice.company_id == cid,
      };
      let seller_match = match seller_id {
        null => true,
        (?sid) => invoice.seller_id == sid,
      };
      return company_match && seller_match;
    });
  };

// Fatura görüntüleme fonksiyonu 
public func get_invoice(seller_id: Nat, invoice_id: Nat) : async Result<?Invoice, Text> {
  let invoice_opt = Trie.find(invoice_trie, invoice_id);
  switch(invoice_opt) {
    case null {
      return Err("Fatura bulunamadı.");
    }
    case (?invoice) {
      if (invoice.seller_id == seller_id) {
        return Ok(?invoice);
      } else {
        return Err("Bu faturaya erişim yetkiniz yok.");
      };
    };
  };
};
    // Trie'yi filtreleyerek satıcının faturalarını bul
func get_invoices_by_seller_id(seller_id : Nat) : async vec Invoice {
  return Trie.fold(invoice_trie, [], (acc, id, invoice) => {
    if (invoice.seller_id == seller_id) {
      acc # [invoice];
    } else {
      acc;
    };
  });
};

};


