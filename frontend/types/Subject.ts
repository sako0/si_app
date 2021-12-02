import { Lecture } from "./Lecture";
import { Teacher } from "./Teacher";

export type SearchSubjectReturn = {
  subjectSearch: Subject[];
};

export type Subject = {
  id: number;
  title: string;
  teacher: Teacher;
  lectures: Lecture[];
};
