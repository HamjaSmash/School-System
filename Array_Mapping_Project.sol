// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract schoolSystem {
    
    struct Student {
        string name ;
        uint grade ;
        bool active ;
    }

// Array to keep all students ids 

uint [] public studentIds ;

mapping (uint => Student) public students ;

// Mapping from student id to array of test scores 

mapping (uint => uint []) public studentScores ;

// Add a new student 

function addStudent(uint id , string memory name) public {
    students[id] = Student(name , 0 , true);
    studentIds.push(id);
}

// Add test score for a student 

function addScore(uint studentId, uint score) public {
    require(students[studentId].active, "Student not found");
    
    studentScores[studentId].push(score);

// Update Grade based on Average 

uint total = 0 ;
uint[] memory scores = studentScores[studentId];
for(uint i = 0; i< scores.length; i++ ) {
     total += scores[i]; 
}

students[studentId].grade = total / scores.length ;

}

// Get all scores for a Student 

function getScores(uint studentId) public view returns (uint[] memory) {
    return studentScores[studentId];
}

// Get total number of Students

function getTotalStudents() public view returns (uint) {
    return studentIds.length;

}

}