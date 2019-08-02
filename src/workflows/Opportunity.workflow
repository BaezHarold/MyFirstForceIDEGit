<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AmountNotBigMoney</fullName>
        <description>Amount Not Big Money</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/AmountNotBigMoney</template>
    </alerts>
    <fieldUpdates>
        <fullName>UpdateName</fullName>
        <field>Name</field>
        <formula>Account.Name + &apos;: &apos; + Name</formula>
        <name>Update Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity Naming Convention</fullName>
        <actions>
            <name>UpdateName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(CONTAINS(Name, Account.Name))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
