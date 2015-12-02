<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Answer_Completed_field</fullName>
        <description>Update Answer Completed field to True from Any Answer field of its parent Discovery Answer object</description>
        <field>Answer_Completed__c</field>
        <literalValue>1</literalValue>
        <name>Update Answer Completed field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>IMP_Update_AnswerCompleted_ToTrue</fullName>
        <actions>
            <name>Update_Answer_Completed_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Answer__c.Any_Answer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
