import { modules, students, mentors, classes } from "./hyf.js";

const possibleMentorsForModule = (moduleName) => {
  return mentors
    .filter((mentor) => mentor.canTeach.includes(moduleName))
    .map((mentor) => mentor.name);
};

console.log(possibleMentorsForModule("using-apis"));

const findMentorForModule = (moduleName) => {
  const moduleMentors = possibleMentorsForModule(moduleName);
  return moduleMentors[Math.floor(Math.random() * moduleMentors.length)];
};
console.log(findMentorForModule("javascript"));
