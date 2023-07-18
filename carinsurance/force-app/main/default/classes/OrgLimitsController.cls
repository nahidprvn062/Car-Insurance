public with sharing class OrgLimitsController {
    @AuraEnabled(cacheable=true)
    public static Map<String, Map<String, Integer>> getOrgLimits() {
        Map<String, Map<String, Integer>> limitsMap = new Map<String, Map<String, Integer>>();
        
        // Retrieve the limits
        Map<String, Integer> orgLimits = new Map<String, Integer>();
        orgLimits.put('LimitQueryRows', Limits.getLimitQueryRows());
        orgLimits.put('Limits.getCpuTime', Limits.getCpuTime());
        orgLimits.put('Limits.getLimitDMLRows ',Limits.getLimitDMLRows());
        // Add more limit types as needed
        
        for (String limitName : orgLimits.keySet()) {
            Map<String, Integer> limitData = new Map<String, Integer>();
            limitData.put('limit', orgLimits.get(limitName));
           
            // You can set the usage and remaining values as needed
            limitData.put('usage', 0);
            limitData.put('remaining', orgLimits.get(limitName));
            limitsMap.put(limitName, limitData);
        }
        
        return limitsMap;
    }
}