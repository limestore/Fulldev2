<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Outage_Active_Name_Field_Update</fullName>
        <field>Outage_Name__c</field>
        <formula>IF( LEFT(Outage_Name__c,7) &lt;&gt; &quot;ACTIVE-&quot;,&quot;ACTIVE-&quot;&amp; Outage_Name__c,&quot;&quot;)</formula>
        <name>Outage – Active Name Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Outage_Expired_Name_Field_Update</fullName>
        <field>Outage_Name__c</field>
        <formula>IF( Left(Outage_Name__c,7) = &quot;ACTIVE-&quot;, Substitute( Outage_Name__c,&quot;ACTIVE-&quot;,&quot;EXPIRED-&quot;),IF( Left(Outage_Name__c,8) = &quot;EXPIRED-&quot;,&quot;&quot;,&quot;EXPIRED-&quot;&amp; Outage_Name__c))</formula>
        <name>Outage – Expired Name Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Outage %E2%80%93 Active Outage</fullName>
        <actions>
            <name>Outage_Active_Name_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Outages__c.Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <description>Add ‘ACTIVE-‘ to Outage name for searching</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Outage %E2%80%93 Expired Outage</fullName>
        <actions>
            <name>Outage_Expired_Name_Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Outages__c.Status__c</field>
            <operation>equals</operation>
            <value>Inactive</value>
        </criteriaItems>
        <description>Add ‘EXPIRED-‘ to Outage name for searching</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
