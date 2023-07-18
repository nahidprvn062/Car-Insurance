public with sharing class UserLoginDetailsController {
    @AuraEnabled
    public static void createUserLoginRecord(String userName,String visitedLink) {
          //Create a new instance of the custom object and set the field values
          
        Community_Access_Tracker__c newRecord = new Community_Access_Tracker__c();
        newRecord.Current_User_Name__c = userName;
        newRecord.Date_Time_Accessed__c = DateTime.now();
        newRecord.Link_Visited__c = visitedLink;
         System.debug('visited link'+newRecord.Link_Visited__c);

            Decimal getCpuTime    =Limits.getCpuTime();
            Decimal getLimitCpuTime=Limits.getLimitCpuTime();
            Decimal cpuTimePercentage=(getCpuTime/getLimitCpuTime*100).setScale(2);
            String cpuTime=String.valueof(cpuTimePercentage)+'% ';
            newRecord.CPU_Time__c=cputime +'(' +Limits.getCpuTime()+'/' +Limits.getLimitCpuTime()+')';

            Decimal getHeapTime =Limits.getHeapSize();
            Decimal getLimitHeapTime=Limits.getLimitHeapSize();
            Decimal HeapTimePercentage=(getHeapTime/getLimitHeapTime*100).setScale(2);
            String HeapTime = String.valueof(HeapTimePercentage)+'% ';
            newRecord.Heap_Size__c = HeapTime +'(' +Limits.getHeapSize()+'/' +Limits.getLimitHeapSize()+')';

            Decimal getCallouts    =Limits.getCallouts();
            Decimal getLimitCallouts = Limits.getLimitCallouts();
            Decimal CalloutsPercentage = (getCallouts/getLimitCallouts*100).setScale(2);
            String CalloutsTime = String.valueof(CalloutsPercentage)+'% ';
            newRecord.Callouts__c=CalloutsTime +'(' +Limits.getCallouts()+'/' +Limits.getLimitCallouts()+')';

    

            Decimal getAggregateQueries    =Limits.getAggregateQueries();
            Decimal getLimitAggregateQueries = Limits.getLimitAggregateQueries();
            Decimal AggregateQueriesPercentage = (getAggregateQueries/getLimitAggregateQueries*100).setScale(2);
            String AggregateQueriesTime = String.valueof(AggregateQueriesPercentage)+'% ';
            newRecord.Aggregate_Queries__c=AggregateQueriesTime +'(' +Limits.getAggregateQueries()+'/' +Limits.getLimitAggregateQueries()+')';

            
            Decimal getDMLRows = Limits.getDMLRows();
            Decimal getLimitDMLRows = Limits.getLimitDMLRows();
            Decimal DMLRowsPercentage = (getDMLRows/getLimitDMLRows*100).setScale(2);
            String DMLRowsTime = String.valueof(DMLRowsPercentage)+'% ';
            newRecord.DML_Rows__c = DMLRowsTime +'(' +Limits.getDMLRows()+'/' + Limits.getLimitDMLRows()+')';


            Decimal getQueries = Limits.getQueries();
            Decimal getLimitQueries = Limits.getLimitQueries();
            Decimal QueriesPercentage = (getQueries/getLimitQueries*100).setScale(2);
            String QueriesTime = String.valueof(QueriesPercentage)+'% ';
            newRecord.SOQL_Queries__c = QueriesTime +'(' +Limits.getQueries()+'/' + Limits.getLimitQueries()+')';

            Decimal getQueryLocatorRows = Limits.getQueryLocatorRows();
            Decimal getLimitQueryLocatorRows = Limits.getLimitQueryLocatorRows();
            Decimal QueryLocatorRowsPercentage = (getQueryLocatorRows/getLimitQueryLocatorRows*100).setScale(2);
            String QueryLocatorTime = String.valueof(QueryLocatorRowsPercentage)+'% ';
            newRecord.SOQL_Query_Locator_Rows__c = QueryLocatorTime +'(' +Limits.getQueryLocatorRows()+'/' +Limits.getLimitQueryLocatorRows()+')';

            
            Decimal getDMLStatements    =Limits.getDMLStatements();
            Decimal getLimitDMLStatements = Limits.getLimitDMLStatements();
            Decimal DMLStatementsPercentage = (getDMLStatements/getLimitDMLStatements*100).setScale(2);
            String DMLStatementsTime = String.valueof(DMLStatementsPercentage)+'% ';
            newRecord.DML_Statements__c=DMLStatementsTime +'(' +Limits.getDMLStatements()+'/' +Limits.getLimitDMLStatements()+')';
       

            Decimal getMobilePushApexCalls = Limits.getMobilePushApexCalls();
            Decimal getLimitMobilePushApexCalls = Limits.getLimitMobilePushApexCalls();
            Decimal LimitMobilePushApexCallsPercentage = (getMobilePushApexCalls/getLimitMobilePushApexCalls*100).setScale(2);
            String LimitMobilePushApexCallsTime = String.valueof(LimitMobilePushApexCallsPercentage)+'% ';
            newRecord.Mobile_Push_Apex_Calls__c = LimitMobilePushApexCallsTime +'(' +Limits.getMobilePushApexCalls()+'/' +Limits.getLimitMobilePushApexCalls()+')';

            Decimal getEmailInvocations    =Limits.getEmailInvocations();
            Decimal getLimitEmailInvocations = Limits.getLimitEmailInvocations();
            Decimal LimitEmailInvocationsPercentage = (getEmailInvocations/getLimitEmailInvocations*100).setScale(2);
            String LimitEmailInvocationsTime = String.valueof(LimitEmailInvocationsPercentage)+'% ';
            newRecord.Email_Invocations__c=LimitEmailInvocationsTime +'(' +Limits.getEmailInvocations()+'/' +Limits.getLimitEmailInvocations()+')';

            Decimal getQueryRows    =Limits.getQueryRows();
            Decimal getLimitQueryRows = Limits.getLimitQueryRows();
            Decimal QueryRowsPercentage = (getQueryRows/getLimitQueryRows*100).setScale(2);
            String QueryRowsTime = String.valueof(QueryRowsPercentage)+'% ';
            newRecord.SOQL_Query_Rows__c=QueryRowsTime +'(' +Limits.getQueryRows()+'/' +Limits.getLimitQueryRows()+')';

            Decimal getPublishImmediateDML = Limits.getPublishImmediateDML();
            Decimal getLimitPublishImmediateDML = Limits.getLimitPublishImmediateDML();
            Decimal PublishImmediateDMLPercentage = (getPublishImmediateDML/getLimitPublishImmediateDML*100).setScale(2);
            String PublishImmediateDMLTime = String.valueof(PublishImmediateDMLPercentage)+'% ';
            newRecord.Push_Immediate_DML_Statements__c=PublishImmediateDMLTime +'(' +Limits.getPublishImmediateDML()+'/' +Limits.getLimitPublishImmediateDML()+')';


            Decimal getAsyncCalls = Limits.getAsyncCalls();
            Decimal getLimitAsyncCalls = Limits.getLimitAsyncCalls();
            Decimal AsyncCallsPercentage = (getAsyncCalls/getLimitAsyncCalls*100).setScale(2);
            String AsyncCallsTime = String.valueof(AsyncCallsPercentage)+'% ';
            newRecord.Async_Calls__c = AsyncCallsTime +'(' +Limits.getAsyncCalls()+'/' + Limits.getLimitAsyncCalls()+')';

            Decimal getQueueableJobs = Limits.getQueueableJobs();
            Decimal getLimitQueueableJobs = Limits.getLimitQueueableJobs();
            Decimal QueueableJobsPercentage = (getQueueableJobs/getLimitQueueableJobs*100).setScale(2);
            String QueueableJobsTime = String.valueof(QueueableJobsPercentage)+'% ';
            newRecord.Queueable_Jobs__c = QueueableJobsTime +'(' +Limits.getQueueableJobs()+'/' + Limits.getLimitQueueableJobs()+')';


        try {
            // Insert the new record
            insert newRecord;
            System.debug('Record created successfully.');
        } catch (Exception e) {
            System.debug('Record creation error: ' + e.getMessage());
        }
    }
}