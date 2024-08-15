const fs = require("fs");

// Assuming you have imported the result.json file containing course data
const data = require("./result.json");
const allElectiveCourse = require("./allCourseNumbersElective.json");

// Initialize an empty string for the result
let result = "";

data.forEach((course) => {
  // Extract the relevant details from each course
  const courseNo = course.courseNo;
  const courseNameTh = course.courseNameTh;
  const courseNameEn = course.courseNameEn;

  if (allElectiveCourse.includes(course.courseNo)) {
    // Append course details to result string
    result += `Course No: ${courseNo}\nCourse Name: ${courseNameTh} (${courseNameEn})\n\nSections:\n`;

    // Loop through each section
    course.sections.forEach((section) => {
      section.classes.forEach((cls) => {
        // Check if section.note is a string and not null
        if (section.note) {
          if (
            typeof section.note === "string" &&
            !section.note.toLowerCase().includes("cedt") &&
            !section.note.toLowerCase().includes("non cp only")
          ) {
            result += `Section No: ${section.sectionNo}\nNote: ${
              section.note
            }\nDay of Week: ${cls.dayOfWeek}\nPeriod: ${cls.period.start} - ${
              cls.period.end
            }\n Teachers: ${cls.teachers.join(", ")}\n\n`;
          } else {
            result += `Section No: ${section.sectionNo}\nNote: CP เรียนไม่ได้ สาสสสสสสสสสสสสสส ${section.note} XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\n\n`;
          }
        } else {
          result += `Section No: ${section.sectionNo}\nNote: ${
            section.note
          }\nDay of Week: ${cls.dayOfWeek}\nPeriod: ${cls.period.start} - ${
            cls.period.end
          }\n Teachers: ${cls.teachers.join(", ")}\n\n`;
        }
      });
    });

    // Separate different courses
    result += "---------------------------\n\n";
  }
});

// Write the result to a file
fs.writeFile("./script/courseInfo.txt", result, (err) => {
  if (err) throw err;
  console.log("The file has been saved!");
});
