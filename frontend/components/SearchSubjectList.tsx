import { useQuery } from "@apollo/react-hooks";
import gql from "graphql-tag";
import { useRef, useState, VFC } from "react";
import { SearchSubjectReturn } from "../types/Subject";

const GET_SEARCH_SUBJECT_LIST = gql`
  query ($subjectTitle: String, $teacherName: String) {
    subjectSearch(subjectTitle: $subjectTitle, teacherName: $teacherName) {
      id
      title
      teacher {
        id
        name
      }
      lectures {
        id
        title
      }
    }
  }
`;

const SearchSubjectList: VFC = () => {
  const [subjectTitle, setSubjectTitle] = useState(null);
  const [teacherName, setTeacherName] = useState(null);
  const inputSubjectTitleElement = useRef(null);
  const inputTeacherNameElement = useRef(null);
  const { loading, error, data } = useQuery<SearchSubjectReturn>(
    GET_SEARCH_SUBJECT_LIST,
    {
      variables: { subjectTitle: subjectTitle, teacherName: teacherName },
    }
  );
  const handleClick = () => {
    setSubjectTitle(inputSubjectTitleElement.current.value);
    setTeacherName(inputTeacherNameElement.current.value);
  };
  if (loading) return <div>"ロード中...."</div>;
  if (error) return <div>Error {error.message}</div>;
  return (
    <div className="w-full max-w-xs mx-auto mt-10">
      <form className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
        <div className="mb-4">
          <label
            className="block text-gray-700 text-sm font-bold mb-2"
            htmlFor="subject_title"
          >
            科目名
          </label>
          <input
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            id="subject_title"
            type="text"
            placeholder="科目名"
            ref={inputSubjectTitleElement}
          />
        </div>
        <div className="mb-6">
          <label
            className="block text-gray-700 text-sm font-bold mb-2"
            htmlFor="teacher_name"
          >
            教授名
          </label>
          <input
            className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            id="teacher_name"
            type="text"
            placeholder="教授名"
            ref={inputTeacherNameElement}
          />
        </div>
        <div className="flex items-center justify-center">
          <button
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
            type="button"
            onClick={() => handleClick()}
          >
            ソート
          </button>
        </div>
      </form>
      <div className="w-full max-w-xs mx-auto mt-10">
        {data.subjectSearch.length ? (
          data.subjectSearch.map((subject) => {
            console.log(subject);

            return (
              <div
                className="bg-white shadow-md rounded px-8 py-2 mb-4"
                key={subject.id}
              >
                <div className="font-bold text-blue-500">
                  授業名:{subject.title}
                </div>
                <div>
                  {subject.lectures.map((lecture) => {
                    return (
                      <div key={lecture.id} className="p-3">
                        <div className="text-xs text-gray-600">
                          ID:{lecture.id}
                        </div>

                        <div className="text-xs text-gray-600">
                          カリキュラム名:{lecture.title}
                        </div>
                      </div>
                    );
                  })}
                </div>
                <div className="text-blue-500 text-right">
                  教授:{subject.teacher.name}
                </div>
              </div>
            );
          })
        ) : (
          <div className="text-xs">該当する授業がありません</div>
        )}
      </div>
    </div>
  );
};

export default SearchSubjectList;
