import { modules, students, mentors, classes } from "./hyf.js";

const getPeopleOfClass = (className) => {
  const classStudents = students
    .filter((student) => student.class === className)
    .map((student) => ({ name: student.name, role: "student" }));

  const classModule = classes.find(
    (currentClass) => currentClass.name === className
  ).currentModule;

  const classMentors = mentors
    .filter((mentor) => mentor.canTeach.includes(classModule))
    .map((mentor) => ({ name: mentor.name, role: "mentor" }));

  return classStudents.concat(classMentors);
};
console.table(getPeopleOfClass("class35"));

const getActiveClasses = () => {
  const activeClasses = classes
    .filter((currentClass) => currentClass.active === true)
    .map((currentClass) => currentClass.name);

  const completeOverview = {};

  activeClasses.forEach(
    (currentClass) =>
      (completeOverview[currentClass] = getPeopleOfClass(currentClass))
  );

  return completeOverview;
};
console.log(JSON.stringify(getActiveClasses(), null, 1));
