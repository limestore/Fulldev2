<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CampaignStatusClosed</fullName>
        <description>Set Campaign Status to &apos;closed&apos; past the campaign close date</description>
        <field>Status</field>
        <literalValue>Completed</literalValue>
        <name>Campaign - Status Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Active_Flag_to_True</fullName>
        <field>IsActive</field>
        <literalValue>1</literalValue>
        <name>Set Active Flag to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Default Active Flag to True</fullName>
        <actions>
            <name>Set_Active_Flag_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When a campaign is created, the Active Flag should be defaulted to True.</description>
        <formula>AND(NOT( ISBLANK(Name )), NOT(BEGINS($User.Username,&quot;integration_user@adp.com&quot;)) )</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Upd - Campaign Status Set to Completed</fullName>
        <actions>
            <name>CampaignStatusClosed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set Campaign Status to &apos;completed&apos; when it is past the completed date</description>
        <formula>EndDate  &lt; TODAY() &amp;&amp; NOT(BEGINS($User.Username,&quot;integration_user@adp.com&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
