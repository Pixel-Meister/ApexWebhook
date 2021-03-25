global class WebhookCallout{    
    @InvocableMethod(label='Post object to webhook' description='Accepts SObjects like Contacts, Accounts, or Leads and posts that record to a URL you specify. Remember to include the domain you are posting to in your org settings.')
    public static void postRequest(List<webhookCalloutInputs> requestList) {
        for (webhookCalloutInputs flowObject : requestList) {
            postToUrl(JSON.serialize(flowObject.inputObject),flowObject.endpoint);
        }
    }
    
    @future(callout=true)
    public static void postToUrl (String body, String endpoint) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(body);
        if(!Test.isRunningTest()) {
            http.send(request);
        }
    }
        public class webhookCalloutInputs {
        @AuraEnabled @InvocableVariable(required=true)
        public SObject inputObject;
        @AuraEnabled @InvocableVariable(required=true)
        public String endpoint;
    }
}
