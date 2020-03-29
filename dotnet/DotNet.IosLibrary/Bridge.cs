//
// Bridge.cs
// Copyright (c) 2018 Yauheni Pakala
//
using System.Net.Http;
using DotNet.SharedLibrary;

namespace DotNet.IosLibrary
{
    /// <summary>
    /// Documentation:
    /// https://docs.microsoft.com/en-us/xamarin/tools/dotnet-embedding/objective-c/best-practices
    /// </summary>
    public class Bridge
    {
        public string Version => "1.0";

        public string TestStr
        {
            get;
            set;
        }

        public int Fib(int n) => Utils.Fib(n);

        public string LoadData(string url)
            => Utils.LoadData(url, new HttpClientHandler());
    }
}
