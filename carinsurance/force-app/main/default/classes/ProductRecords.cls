public class ProductRecords {
    @AuraEnabled(cacheable=true)
    public static List<Product_Insurance__c> getproduct() {
        List<Product_Insurance__c> productRecords = [SELECT Id, Name,Product_Id__c, Term__c, Mileage__c, Status__c, Expiration_Date__c 
                                                     FROM Product_Insurance__c ];
        return productRecords;
    }
}