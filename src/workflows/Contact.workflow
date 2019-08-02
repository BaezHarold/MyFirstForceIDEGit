<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>ChangeMailingAddress</fullName>
        <field>MailingStreet</field>
        <formula>Account.ShippingStreet</formula>
        <name>Change Mailing Address</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Change Mailing Address</fullName>
        <actions>
            <name>ChangeMailingAddress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Account.ShippingStreet  !=  MailingStreet</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
