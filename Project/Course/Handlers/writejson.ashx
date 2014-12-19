<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;

using Newtonsoft.Json;

using Course.Models;




public class Handler : IHttpHandler {
    
    
    
    
    public void ProcessRequest (HttpContext context)
    {


   /*     Lesson lesson = new Lesson();
        
        lesson.Title   = context.Request["jtitle"];
        lesson.Content = context.Request["jcontent"];
        lesson.Thems   = context.Request["jthems"];
        lesson.Tags    = context.Request["jtags"];
     */   

    //    File.WriteAllText("F:\\213.json", lesson.Title + lesson.Content + lesson.Thems + lesson.Tags);
        
        //lesson.Title = "";

      //  JavaScriptSerializer s = new JavaScriptSerializer();


        //Lesson jsonString = s.Deserialize(context);
        
        //File.WriteAllText("F:\\213.json", context.Request["jtitle"].ToString());
        
 //           context.Request.InputStream.Seek(0, SeekOrigin.Begin);
   //         StreamReader StreamReader = new StreamReader(context.Request.InputStream, System.Text.Encoding.UTF8);
     //       string JSON = StreamReader.ReadToEnd().Trim();
        
        

//        Lesson jsonString = JsonConvert.DeserializeObject<Lesson>(JSON);
        
        //File.WriteAllText("F:\\web\\course\\incom.json", context.ToString());
        
       // StreamReader sr = new StreamReader(context.ToString());

        // string res = context.Request["f"];"F:\\web\\Course\\test2.json"

        //Json(, JsonRequestBehavior.AllowGet);

    //   context.Response.ContentType = "text/plain"; //application/json
     //  context.Response.Write(jsonString);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}