public with sharing class ProductController {
        @AuraEnabled( cacheable = true )
        public static List< ProductWrapper > fetchProduct() {
    
            List< ProductWrapper > listWrap = new List< ProductWrapper >();
    
            for ( Product_Insurance__c objProduct : [ 
                SELECT Id, Name,Product_Id__c, Term__c, Mileage__c, Status__c, Expiration_Date__c,  
               (SELECT Id, Name, Purchase_Date__c, Starting_Expiration_Mileage__c, 
               Deductible__c From Contracts__r ) 
                FROM Product_Insurance__c WHERE Status__c = 'Active' 
            ] ) {
    
                ProductWrapper objWrap = new ProductWrapper( true, objProduct, objProduct.Contracts__r.size() > 0 ? true : false );
                listWrap.add( objWrap );
    
     //return [select id,Name,Mileage__c,Status__c,(select Name 
    
            }
    
    System.debug('---------->'+listWrap);
            return listWrap;
    
        }
    
     
    
        public class ProductWrapper {
    
     
    
            @AuraEnabled
            public Boolean hideBool;
            @AuraEnabled
            public Boolean contractBool;
            @AuraEnabled
            public Product_Insurance__c objProduct;
    
     
    
            public ProductWrapper( Boolean hideBool, Product_Insurance__c objProduct, Boolean contractBool ) {
    
     
    
                this.hideBool = hideBool;
                this.objProduct = objProduct;
                this.contractBool = contractBool;
    
     
    
            }
    
     
    
        }
    
    }