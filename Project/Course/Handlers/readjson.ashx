<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;
using System.Collections.Generic;
using Newtonsoft.Json;
using Course.Models;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {


        Lesson lesson = new Lesson();

        lesson.Title = "Создать макет главное страницы";

        LessonPart lessonPart = new LessonPart();

        LessonPartPage pageDesc1 = new LessonPartPage();
        LessonPartPage pageDesc2 = new LessonPartPage();
        LessonPartPage pageTut1 = new LessonPartPage();
        LessonPartPage pageJob1 = new LessonPartPage();
        LessonPartPage pageJob2 = new LessonPartPage();

        List<LessonPart> listLessonPart = new List<LessonPart>();
        
        List<LessonPartPage> listDescPage = new List<LessonPartPage>();
        List<LessonPartPage> listTutPage = new List<LessonPartPage>();
        List<LessonPartPage> listJobPage = new List<LessonPartPage>();

        lessonPart.LessonNumber = 1;
        lessonPart.Type = "task";
        lessonPart.Title = "Урок 1. Введение в структуру html";
        lessonPart.Tags = "css, блочная верстка, chrome development tools";
        lessonPart.Tech = "div, float, width, padding, margin";
        lessonPart.Comment = "Приватный коммент";
        lessonPart.Hint = 50;

        
        pageDesc1.PageNumber = 1;
        pageDesc1.Content = "author manager Клиент одобрил вот такой макет главной страницы.<src=/1/maket1.png> Это черновой вариант, но надо уже приступать.</author>";
        
        pageDesc2.PageNumber = 2;
        pageDesc2.Content = "<author coach>Давай посмотрим что тебе понадобится, чтобы его сделать? Сразу договоримся что верстка у нас будет блочная, стили сразу вынесем " + 
            " в отдельный файл. Работать и обсуждать относително браузера хром. Рабочую среду мы уже настроили. Тебе понадобится вот такие html элементы <code>div<code> " + 
            " и стили: <code>width, padding, margin, background-color, float<code> Если надо, я покажу более подробно.";
   
        
        

        pageTut1.PageNumber = 1;
        pageTut1.Content = "Div - кирпичик верстки В данном курсе для начинающих мы не будем заострять внимание на методологиях современной разработки больших проектов. " + 
            " Такие методологии как БЭМ, сейчас нам важно уловить самую суть верстки, прочно уяснить основы. Блок (или слой) - это элемент веб-страницы созданный с помощью " + 
            " тега <code>Div</code>. К которому привязано стилевое оформление. В первых уроках мы сосредоточимся на использовании тегов  и их стилевого оформления при помощи " +
            " классов. Это даст вам надежную основу. Вы сможете верстать практически любой макет.<code>Div</code> <code>Div</code> - это основа современной " +
            " верстки, ее кирпичик. <code>Div</code> могут вкладываться друг в друга. Старайтесь делать так, чтобы код распадался на ряд четких и наглядных блоков, " +
            " каждый из которых имеет свое предназначение. <img src=\"i/tutorial1_1.png\"/> Чтобы прочно усвоить теорию, сохрани ссылки ниже, чтобы почитать " +
            " в транспоте. web-lesson.ru/site-creation/html/38-osnovy-css-i-html-blochnaya-verstka.html ";

        pageJob1.PageNumber = 1;
        pageJob1.Content = "Создайте файл стилей style.css и добавь link css для его подключения, как я рассказывал.";

        pageJob2.PageNumber = 2;
        pageJob2.Content = "Задай первоначальную разметку страницы, например, так: <body> <div class=\"header_row\"></div> <div class=\"navigation-row\"></div><div class=\"slider\"></div> " +
            " <div class=\"module1\"></div><div class=\"module2\"></div><div class=\"footer_row\"></div></body>";


        listDescPage.Add(pageDesc1);
        listDescPage.Add(pageDesc2);

        listTutPage.Add(pageTut1);

        listJobPage.Add(pageJob1);
        listJobPage.Add(pageJob2);
        
        lessonPart.Description = listDescPage;
        lessonPart.Tutorial = listTutPage;
        lessonPart.Job = listJobPage;
        
        listLessonPart.Add(lessonPart);

        lesson.LessonPart = listLessonPart;

        string res = JsonConvert.SerializeObject(lesson);
            
            
   //     string res = JsonConvert.SerializeObject(lesson);

        
        //File.ReadAllText
            
        
  /*      StreamReader sr = new StreamReader("F:\\web\\Course\\test2.json");

        string res = "";

        while (!sr.EndOfStream) //Цикл длиться пока не будет достигнут конец файла
        {
            res += sr.ReadLine(); //В переменную str по строчно записываем содержимое файла
        }*/

//        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();

//        var myObject = new MyObject();

       context.Response.ContentType = "application/json";
//        context.Response.Write(serializer.Serialize(myObject));
//        context.Response.End();
        
 //       context.Response.ContentType = "text/plain";
        context.Response.Write(res);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}