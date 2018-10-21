//
// Bridge.cs
// Copyright (c) 2018 Yauheni Pakala
//
using DotNet.SharedLibrary;

namespace DotNet.AndroidLibrary
{
    /// <summary>
    /// Documentation:
    /// https://docs.microsoft.com/en-us/xamarin/tools/dotnet-embedding/get-started/java/android#current-limitations-on-android
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
    }
}
