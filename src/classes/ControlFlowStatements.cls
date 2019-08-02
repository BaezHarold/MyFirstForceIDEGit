public class ControlFlowStatements {
    
    /* 
// enum practice
void printWeather(Season s) {
    if(s == Season.WINTER)
        System.debug('Its Cold!');
    else if(s == Season.SPRING)
        System.debug('Its Warm!');
    else if(s == Season.SUMMER)
        System.debug('Its Hot!');
    else if(s == Season.FALL)
        System.debug('Its Chilly!');
}

printWeather(Season.WINTER);
printWeather(Season.SPRING);
printWeather(Season.SUMMER);
printWeather(Season.FALL);

// If Statement
if(true) {
    System.debug('true');
} else {
    System.debug('false');
}

if (4 < 5) {
    System.debug('4 is less than 5');
} else {
    System.debug('Math is a LIE!');
}

// If-else-if
Integer testScore = 60;

if(testScore >= 90) {
    System.debug('A');
} else if(testScore >= 80) {
    System.debug('B');
} else if(testScore >= 70) {
    System.debug('C');
} else if(testScore >= 60) {
    System.debug('D');
} else {
    System.debug('F');
}


// Switch Statement
// Apex switch statement expressions can be one of the following types:
// - Integer
// - Long
// - sObject
// - String
// - Enum

Integer i = 0;

switch on i {
    when 0 {
        System.debug('0');
    } when 1 {
        System.debug('1');
    } when else {
        System.debug('Some other number');
    }
}


Integer j = 2;

switch on j {
    when 1,2,3 {
        System.debug('1 2 or 3');
    } when 4,5,6 {
        System.debug('4 5 or 6');
    } when else {
        System.debug('Some other number');
    }
}

// While Loops
// The while loops checks the Boolean condition before the first loop is executed
// Consequently, it is possible for the code block to never execute.

Integer count = 1;
while (count < 11) {
    System.debug('Count: ' + count);
    count++;
}

// Do-while Loops
// The Apex do-while loop repearedly executes a block of code as long as a 
// particualar Boolean condition remains true.
// do-while loop does not check the Boolean condition until after
// the first loop is executed

Integer count = 1;
do{
    System.debug('Count: ' + count);
    count++;
} while (count < 11);

// For Loops
// for (Starting point; condition; incrementation||decrementation)
for (Integer i = 0; i < 10; i++) {
    System.debug('i: ' + i);
}

List<Account> accList = new List<Account>();
accList.add(new Account(Name='Matt'));
accList.add(new Account(Name='Joe'));

for(Integer i = 0; i < accList.size(); i++) {
    System.debug('acc: ' + accList[i].Name);
}

for(Account a : accList) {
    System.debug('acc: ' + a.Name);
}


*/

}