const { gql } = require('@apollo/client');

const QUERY = gql`
  query SearchCourse($filter: FilterInput!, $courseGroup: CourseGroupInput!) {
    search(filter: $filter, courseGroup: $courseGroup) {
      ...CourseDataFields
    }
  }

  fragment CourseDataFields on Course {
    studyProgram
    semester
    academicYear
    courseNo
    abbrName
    courseNameTh
    courseNameEn
    faculty
    department
    credit
    creditHours
    courseCondition
    courseDescTh
    courseDescEn
    genEdType
    midterm {
      date
      period {
        start
        end
      }
    }
    final {
      date
      period {
        start
        end
      }
    }
    sections {
      genEdType
      sectionNo
      closed
      capacity {
        current
        max
      }
      note
      classes {
        type
        dayOfWeek
        period {
          start
          end
        }
        room
        building
        teachers
      }
    }
  }
`;

const variables = {
  filter: {
    keyword: '21',
    limit: 15,
    offset: 15,
  },
  courseGroup: {
    studyProgram: 'S',
    academicYear: '2567',
    semester: '2',
  },
};

client
  .query({
    query: QUERY,
    variables: variables,
  })
  .then((response) => console.log(response.data));
