@isTest
public class TestWebookCallout {
    @isTest static void testIdList() {
        SObject one = new Contact(
          Email = 'name@email.org',
            FirstName = 'first',
            LastName = 'last'
        );
        WebhookCallout.webhookCalloutInputs testCalloutOne = new WebhookCallout.webhookCalloutInputs();
        testCalloutOne.inputObject = one;
        testCalloutOne.endpoint = 'exampleendpoint.com';
        List<WebhookCallout.webhookCalloutInputs> listInputs = new List<WebhookCallout.webhookCalloutInputs>();
        listInputs.add(testCalloutOne);
        test.startTest();
    WebhookCallout.postRequest(listInputs);
        Test.stopTest();
    }
}
