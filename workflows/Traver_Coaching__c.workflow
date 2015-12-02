<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>DS_Traver_PartyID_TC</fullName>
        <field>PartyID__c</field>
        <formula>Traver_Project__r.Account__r.PartyID__c</formula>
        <name>DS_Traver_PartyID_TC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>DS_Traver_UPD_PartyID_TC</fullName>
        <actions>
            <name>DS_Traver_PartyID_TC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates PatryId on creation of new record</description>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
