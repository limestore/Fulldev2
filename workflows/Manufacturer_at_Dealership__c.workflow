<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>CB_Stop_Gap_New_DS_Manuf_Addition_Temp</fullName>
        <description>CB Stop-Gap New DS Manuf Addition-Temp</description>
        <protected>false</protected>
        <recipients>
            <recipient>cameron.wong@cdk.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ADP_Dealer_Services/CB_New_DS_Manuf_Addition</template>
    </alerts>
    <rules>
        <fullName>Email - CB Stop-Gap New Manuf Added-Temp</fullName>
        <actions>
            <name>CB_Stop_Gap_New_DS_Manuf_Addition_Temp</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>needed for &apos;stop-gap&apos; until CCF can be modified to send these emails.</description>
        <formula>AND(NOT(ISBLANK(Account__r.Account_Number__c )), NOT(ISBLANK(Account__r.PartyID__c)), CASE(Account__r.Segment_Code__c, &quot;NAAT&quot;, &quot;NAAT&quot;, &quot; &quot;) = &quot;NAAT&quot;, CASE(Account__r.Site_Type__r.Name, &quot;Auto&quot;, &quot;Auto&quot;, &quot;Corporation&quot;, &quot;Corporation&quot;, &quot;District&quot;, &quot;District&quot;, &quot;Group&quot;, &quot;Group&quot;, &quot;OEM&quot;, &quot;OEM&quot;, &quot;Under Construction&quot;, &quot;Under Construction&quot;, &quot;Used Vehicle&quot;, &quot;Used Vehicle&quot;, &quot; &quot;) = CASE( Account__r.Site_Type__r.Name , &quot;Auto&quot;, &quot;Auto&quot;, &quot;Corporation&quot;, &quot;Corporation&quot;, &quot;District&quot;, &quot;District&quot;, &quot;Group&quot;, &quot;Group&quot;, &quot;OEM&quot;, &quot;OEM&quot;, &quot;Under Construction&quot;, &quot;Under Construction&quot;, &quot;Used Vehicle&quot;, &quot;Used Vehicle&quot;, &quot; &quot;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
