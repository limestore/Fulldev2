<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>DS_Sls_Upd_Completed_Date</fullName>
        <field>Completed_Date__c</field>
        <formula>TODAY()</formula>
        <name>DS_Sls_Upd_Completed_Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DS_Sls_Upd_Completed_Date_Null</fullName>
        <field>Completed_Date__c</field>
        <name>DS_Sls_Upd_Completed_Date_Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Record_type_to_Social</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Social_Consultant_Task</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Record type to Social</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Type_field_to_Social</fullName>
        <field>Type</field>
        <literalValue>Social Consultant Task</literalValue>
        <name>Type field to Social</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>CB_Social_Consult_UpdateTask</fullName>
        <actions>
            <name>Type_field_to_Social</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>LastModifiedBy.UserRole.Name = &quot;Social Media Consultant&quot; &amp;&amp; NOT(BEGINS($User.Username,&quot;integration_user@adp.com&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DS_Sls_Upd_Task_Completed_Date</fullName>
        <actions>
            <name>DS_Sls_Upd_Completed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Updates Completed date to current date whenever a task status gets completed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DS_Sls_Upd_Task_Completed_Date_Null</fullName>
        <actions>
            <name>DS_Sls_Upd_Completed_Date_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>notEqual</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Updates Completed date to null whenever a task status is not completed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
