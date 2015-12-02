<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CustomerLoyaltyDealershipcontactedbyCAMwantaSalesCall</fullName>
        <description>Customer Loyalty Dealership contacted by CAM &amp; want a Sales Call</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>chris.rayl@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>dave.hanson@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>noreply.salesforce@cdk.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ADP_Dealer_Services/Customer_Loyalty_Sales_Rep_Need</template>
    </alerts>
    <rules>
        <fullName>Email - Customer Loyalty Email to Sales</fullName>
        <actions>
            <name>CustomerLoyaltyDealershipcontactedbyCAMwantaSalesCall</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND (2 OR 3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>Campaign_Account_Members__c.Campaign_Member_Status__c</field>
            <operation>contains</operation>
            <value>Sales Requested to Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign_Account_Members__c.Composite_ID__c</field>
            <operation>contains</operation>
            <value>701400000005J98</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign_Account_Members__c.Composite_ID__c</field>
            <operation>contains</operation>
            <value>701400000005JVr</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign_Account_Members__c.Composite_ID__c</field>
            <operation>contains</operation>
            <value>701400000005JVm</value>
        </criteriaItems>
        <description>When on of the Customer Loyalty Campaigns are set to status of &quot;Sales Requested to Call&quot;, send an email to baseline rep, DOS, AVP, Chris Rayl</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
