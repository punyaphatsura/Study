const fs = require("fs");

// Multi-line string containing the course information
const coursesText = `
2110291      เอกัตศึกษาทางวิศวกรรมคอมพิวเตอร์ 1 (Individual Study in Computer Engineering I) 1(0-0-3)
2110292      เอกัตศึกษาทางวิศวกรรมคอมพิวเตอร์ 2 (Individual Study in Computer Engineering II) 1(0-0-3)
2110315       ระบบเชิงขนานและระบบกระจาย (Parallel and Distributed Systems) 3(3-0-6)
2110391       เอกัตศึกษาทางวิศวกรรมคอมพิวเตอร์ 3 (Individual Study in Computer Engineering III) 1(0-0-3)
2110392       เอกัตศึกษาทางวิศวกรรมคอมพิวเตอร์ 4 (Individual Study in Computer Engineering IV) 1(0-0-3)
2110412       สถาปัตยกรรมคอมพิวเตอร์เชิงขนาน (Parallel Computer Architecture) 3(3-0-6)
2110413       ความมั่นคงของคอมพิวเตอร์ (Computer Security) 3(3-0-6)
2110414       ระบบการคำนวณขนาดใหญ่ (Large Scale Computing Systems) 3(3-0-6)
2110420       การสร้างตัวแปลภาษา (Compiler Construction) 3(3-0-6)
2110421       ทฤษฎีของภาษาการทำโปรแกรม (Theory of Programming Languages) 3(3-0-6)
2110424       การปรับปรุงกระบวนการซอฟต์แวร์ (Software Process Improvement) 3(3-0-6)
2110428       ความรู้เบื้องต้นเกี่ยวกับการทำเหมืองข้อมูล (Introduction to Data Mining) 3(3-0-6)
2110429       ระบบการเรียกใช้สารสนเทศ (Information Retrieval Systems) 3(3-0-6)
2110430       การทำเหมืองอนุกรมเวลาและการค้นหาความรู้ (Time Series Mining and Knowledge Discovery) 3(3-0-6)
2110431       วิทยาการภาพดิจิทัลเบื้องต้น (Introduction to Digital Imaging) 3(3-0-6)
2110432       การรู้จำเสียงพูดอัตโนมัติ (Automatic Speech Recognition) 3(3-0-6)
2110433       คอมพิวเตอร์วิชัน (Computer Vision) 3(3-0-6)
2110435       วิทยาการหุ่นยนต์เบื้องต้น (Introduction to Robotics) 3(3-0-6)
2110441       การออกแบบและพัฒนาซอฟต์แวร์ (Software Design and Development) 3(3-0-6)
2110442       การวิเคราะห์และโปรแกรมเชิงวัตถุ (Object-Oriented Analysis and Programming) 3(3-0-6)
2110443       ปฏิสัมพันธ์ของมนุษย์กับคอมพิวเตอร์ (Human-Computer Interaction) 3(3-0-6)
2110451       การออกแบบฮาร์ดแวร์ของดิจิตอลคอมพิวเตอร์ (Digital Computer Hardware Design) 3(3-0-6)
2110455       การทดสอบวงจรดิจิตอล (Testing Digital Circuits) 3(3-0-6)
2110473       การคำนวณแบบทนต่อความผิดพร่อง (Fault Tolerant Computing) 3(3-0-6)
2110475       การออกแบบวงจรรวมขนาดใหญ่มาก (VLSI Design) 3(3-0-6)
2110476       ปัญญาประดิษฐ์ 1 (Artificial Intelligence I) 3(3-0-6)
2110477       ปัญญาประดิษฐ์ 2 (Artificial Intelligence II) 3(3-0-6)
2110478       คอมพิวเตอร์และการสื่อสาร (Computer and Communication) 3(3-0-6)
2110479       คอมพิวเตอร์กราฟิก (Computer Graphics) 3(3-0-6)
2110481       เครือข่ายคอมพิวเตอร์ไร้สาย (Wireless Computer Networks) 3(3-0-6)
2110490       โครงการวิศวกรรมคอมพิวเตอร์พื้นฐาน (Computer Engineering Pre-Project) 1(0-2-1)
2110491       หัวข้อในระบบและภาษา (Topics in Systems and Languages) 3(3-0-6)
2110495       หัวข้อชั้นสูงในวิศวกรรมคอมพิวเตอร์ 1 (Advanced Topics in Computer Engineering I) 3(3-0-6)
2110496       หัวข้อชั้นสูงในวิศวกรรมคอมพิวเตอร์ 1 (Advanced Topics in Computer Engineering II) 3(3-0-6)
2110497       ปัญหาพิเศษทางวิศวกรรมคอมพิวเตอร์ 1 (Special Problems in Computer Engineering I) 3(2-3-4)
2110498       ปัญหาพิเศษทางวิศวกรรมคอมพิวเตอร์ 2 (Special Problems in Computer Engineering II) 3(2-3-4)
2110499       โครงการวิศวกรรมคอมพิวเตอร์ (Computer Engineering Projects) 3(0-6-3)
2100499      โครงงานทางวิศวกรรม (Senior Project in Engineering) 3(0-6-3)
2110501       ออโตมาตา ความสามารถในการคำนวณและภาษาเชิงรูปนัย (Automata Computability and Formal Languages) 3(3-0-9)
2110511       การเขียนโปรแกรมเกม (Game Programming) 3(3-0-9)
2110512       คอมพิวเตอร์แอนิเมชัน (Computer Animation) 3(3-0-9)
2110513       เทคโนโลยีช่วยเหลือ (Assistive Technology) 3(3-0-9)
2110522       ยูนิกซ์/ลีนุกซ์สำหรับองค์กร (UNIX/Linux for Enterprise Environment) 3(3-0-9)
2110541        การตรวจสอบระบบคอมพิวเตอร์ (Computer Systems Audit) 3(3-0-9)
2110514        คอมพิวเตอร์กราฟิกส์และการจำลองทางฟิสิกส์แบบเรียลไทม์ (Realtime Computer Graphics and Physics Simulation) 3 (3-0-9)
2110524        เทคโนโลยีคลาวด์คอมพิวติง (Cloud Computing Technology)3 (3-0-9)
2110542        ระบบคลังข้อมูล (Data Warehouse System) 3-(3-0-9)
2110561        การผลิตเชิงคำนวณ (Computational Fabrication) 3 (3-0-9)
2110562        เทคโนโลยีตัวรับรู้ (SENSOR TECH) 3 (3-0-9)
2110571        โครงข่ายประสาท (Neural Network) 3 (3-0-9)
2110572        ระบบการประมวลผลธรรมชาติ (Natural Language Processing System) 3 (3-0-9)
2110573        การรู้จำแบบ (Pattern Recognition) 3 (3-0-9)
2110574        ปัญญาประดิษฐ์สำหรับวิศวกร (Artificial Intelligence for Engineers) 3 (3-0-9)
2110581        ชีวสารสนเทศ 1 (Bioinformatics I) 3 (3-0-9)
`;

// Split the text by new lines
const courseLines = coursesText.trim().split("\n");

// Initialize an array to store course numbers
const courseNumbers = [];

// Regular expression to match course numbers
const courseNumberRegex = /^[0-9]{7}/;

// Extract course numbers
courseLines.forEach((line) => {
  const match = line.match(courseNumberRegex);
  console.log(match);
  if (match) {
    courseNumbers.push(match[0]);
  }
});

// Output the course numbers
// console.log(courseNumbers);

// Optionally, write the course numbers to a file
fs.writeFile(
  "script/allCourseNumbersElective.json",
  JSON.stringify(courseNumbers, null, 2),
  (err) => {
    if (err) throw err;
    console.log("Course numbers have been saved to courseNumbers.json!");
  }
);
