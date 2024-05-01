using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolLynxLibrary.Models
{
    public class PatchMessage
    {
        public PatchMessage(string? title, string text)
        {
            Title = title;
            Text = text;
        }

        public string? Title { get; }
        public string Text { get; }
    }
}
