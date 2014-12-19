using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Course.Models
{
    public class Lesson
    {
        public int Id;
        public string Title;
        public List<LessonPart> LessonPart; 
    }

    public class LessonPart
    {
        public int LessonId;
        public int LessonNumber;
        public string Title;
        public string Type;
        public string Tags;
        public string Tech;
        public int Hint;
        public string Comment;
        public List<LessonPartPage> Description;
        public List<LessonPartPage> Tutorial;
        public List<LessonPartPage> Job;

    }

    public class LessonPartPage
    {
        public int PageNumber;
        public string Content;
    }

}