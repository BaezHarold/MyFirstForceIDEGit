<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>UnassignedLeads</fullName>
        <description>Unassigned Leads</description>
        <protected>false</protected>
        <recipients>
            <recipient>baezh@070819salesforce.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/UnassignedLeads</template>
    </alerts>
    <rules>
        <fullName>Unassigned Leads</fullName>
        <actions>
            <name>UnassignedLeads</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>(NumberOfDaysNeglected__c == 0) &amp;&amp; (Owner:Queue.QueueName == &apos;UnnassignedLeadQueue&apos;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
