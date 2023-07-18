public without sharing class GetChild {
     @AuraEnabled( cacheable = true )
    public static List< ProductWrapper > fetchProducts(Id userId) {
     
        List< ProductWrapper > listWrap = new List< ProductWrapper >();
        
        
        for ( Product_Insurance__c objPro : [ select id,Name,Mileage__c,Status__c,Term__c,Expiration_Date__c,Product_Id__c,
                    (select Name,Deductible__c,Purchase_Date__c,Starting_Expiration_Mileage__c,Product_Insurance__c 
                     from Contracts__r WHERE Contract_Purchased_By__c=:userId ) from 
                    Product_Insurance__c WHERE Id IN (SELECT Product_Insurance__c FROM Contract_Insurance__c WHERE Contract_Purchased_By__c=:userId) ] ) {
            
                    ProductWrapper objWrap = new ProductWrapper( true, objPro, objPro.Contracts__r.size() > 0 ? true : false );
                    listWrap.add( objWrap );

        }

        return listWrap;
         
    }

    public class ProductWrapper {

        @AuraEnabled
        public Boolean hideBool;
        @AuraEnabled
        public Boolean Contractbool;
        @AuraEnabled
        public Product_Insurance__c objProduct;

        public ProductWrapper( Boolean hideBool, Product_Insurance__c objProduct, Boolean Contractbool ) {

            this.hideBool = hideBool;
            this.objProduct = objProduct;
            this.Contractbool =  Contractbool;

        }

    }
}