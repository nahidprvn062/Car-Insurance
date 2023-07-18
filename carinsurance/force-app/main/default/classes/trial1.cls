public class trial1 {
    @AuraEnabled(cacheable=true)
    public static List<Product_Insurance__c> getproduct() {
        List<Product_Insurance__c> pi = [SELECT Id, Name, Term__c, Mileage__c, Status__c, Expiration_Date__c FROM Product_Insurance__c];
        // return [SELECT Id, Name, Term__c, Mileage__c, Status__c, Expiration_Date__c FROM Product_Insurance__c];
        // return [SELECT Id, Name FROM Product_Insurance__c];
        return pi;
     }
}