using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Text.RegularExpressions;

namespace ProjectDBModel.Model
{
   public  class RSSReader
    {


       private static string _blogURL = "http://rss.cbc.ca/lineup/technology.xml";
 public static IEnumerable<Rss> GetRssFeed()
 {
     XDocument feedXml = XDocument.Load(_blogURL);
     var feeds = from feed in feedXml.Descendants("item")
                 select new Rss
                 {
                     Title = feed.Element("title").Value,
                     Link = feed.Element("link").Value,
                     Description = Regex.Match(feed.Element("description").Value, @"^.{1,180}\b(?<!\s)").Value
                 };
     return feeds;
 }
}
}
    

