public with sharing class LimitController {
   @AuraEnabled
  public static void createCommunityLimit(String currentUserName,String visitedLink){
try{
  Community_Access_Tracker__c newRecord = new Community_Access_Tracker__c();
  newRecord.Current_User_Name__c=currentUserName;
  // newRecord.Date_Time_Accessed__c =DateTime.now();
  newRecord.Link_Visited__c = visitedLink;

Decimal getCpuTime	=Limits.getCpuTime();
Decimal getLimitCpuTime=Limits.getLimitCpuTime();
System.debug('getCpuTime'+ getCpuTime );
System.debug('getLimitCpuTime'+ getLimitCpuTime );
Decimal cpuTimePercentage=(getCpuTime/getLimitCpuTime*100).setScale(2);
String cpuTime=String.valueof(cpuTimePercentage)+'% ';
newRecord.CPU_Time__c=cputime +'(' +Limits.getCpuTime()+'/' +Limits.getLimitCpuTime()+')';
insert newRecord;
}
catch (Exception e) {
    System.debug('Exception hit');
  }
  }
}


























































  // public with sharing class AccountController {
//   @AuraEnabled(cacheable=true)
//   public static List<ContentVersion> getAccountFiles(Id contactId) {
//           List<ContentDocumentLink> documentLinks = [
//             SELECT ContentDocumentId
//             FROM ContentDocumentLink
//             WHERE LinkedEntityId = :contactId
//           ];
      
//           Set<Id> documentIds = new Set<Id>();
//           for (ContentDocumentLink link : documentLinks) {
//             documentIds.add(link.ContentDocumentId);
//           }
      
//           List<ContentDocument> files = [ SELECT Id, Title,ContentUrl FROM ContentDocument
//             WHERE Id IN :documentIds];
      
//           return files;
//         }
//       }
      
