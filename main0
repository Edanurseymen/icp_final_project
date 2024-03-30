import List "mo:base/List";
import Option "mo:base/Option";
import Trie "mo:stdlib/trie";
import Text "mo:base/Text";
import Time "mo:base/Time";
import Int "mo:base/Int";
import Hash "mo:base/Hash";
import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Bool "mo:base/Bool";
import Map "mo:base/HashMap";
import Nat "mo:base/Nat";
import Random "mo:base/Random";

actor FaturaSistemi {
// Şirket bilgilerini tutmak için veri yapısı

type Company = {
    companyId : Nat;
    companyName : Text;
};

type User = {
    userId : Nat;
    name : Text;
    password : Text;

 // Ürün bilgilerini tutmak için veri yapısı
type Product = {
    productId : Nat;
    companyId : Nat;
    productName : Text;
    brand : Text;
    price : Nat;
};

 // Fatura bilgilerini tutmak için veri yapısı
type Invoice = {
    invoiceId : Nat;
    companyId : Nat;
    productIds : [Nat];
    sellerId : Nat;
    customerName : Text;
};
 
// ürün bilgilerini saklamak için trie Randevu listesi
 var productTrie : Trie.Trie<Nat, Product> = Trie.empty();
 
//şirketlerin listesi
 var companyTrie : Trie.Trie<Nat, Company> = Trie.empty();

//kullanıcı listesi
 var userTrie : Trie.Trie<Nat, User> = Trie.empty();

 //fatura listesi
 var invoiceTrie : Trie.Trie<Nat, Invoice> = Trie.empty();

// Şirket kaydı alma fonksiyonu
    func registerCompany(companyName: Text) : async Nat {
        let newCompanyId = Array.length(companies) + 1;
        let newCompany = { companyId = newCompanyId; companyName = companyName };
        companies := companies # [newCompany];
        return newCompanyId;
    };


 // Kullanıcı (satıcı) kaydı alma fonksiyonu
    func registerUser(userName: Text) : async Nat {
        let newUserId = Array.length(users) + 1;
        let newUser = { userId = newUserId; userName = userName };
        users := users # [newUser];
        return newUserId;
    };

// Ürün kaydı oluşturma fonksiyonu
    func createProduct(companyId: Nat, productName: Text, brand: Text, price: Nat) : async Nat {
        let newProductId = Array.length(products) + 1;
        let newProduct = { productId = newProductId; companyId = companyId; productName = productName; brand = brand; price = price };
        products := products # [newProduct];
        return newProductId;
    };
 // Fatura kesme fonksiyonu
    func createInvoice(companyId: Nat, productIds: [Nat], sellerId: Nat, customerName: Text) : async Nat {
        let newInvoiceId = Array.length(invoices) + 1;
        let newInvoice = { invoiceId = newInvoiceId; companyId = companyId; productIds = productIds; sellerId = sellerId; customerName = customerName };
        invoices := invoices # [newInvoice];
        return newInvoiceId;
    };

// Kullanıcının faturalarını listeleme fonksiyonu
    func listUserInvoices(userId: Nat) : async [Invoice] {
        let userInvoices = [for (invoice in invoices) if (invoice.sellerId == userId) invoice];
        return userInvoices;
    };

// ID'ye göre tek bir faturayı getirme fonksiyonu
    public func getInvoiceById(userId: Nat, invoiceId: Nat) : async ?Invoice {
        let userInvoice = [for (invoice in invoices) if (invoice.sellerId == userId && invoice.invoiceId == invoiceId) invoice];
        return switch (Array.length(userInvoice)) {
            case 0 { null };
            case _ { userInvoice[0] };
        };
    };

}

