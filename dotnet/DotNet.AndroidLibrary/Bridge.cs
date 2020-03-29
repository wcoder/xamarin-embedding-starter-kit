//
// Bridge.cs
// Copyright (c) 2018 Yauheni Pakala
//
using System;
using DotNet.SharedLibrary;
using Xamarin.Android.Net;
using Android.Util;

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

        public string LoadData(string url)
        {
            try
            {
                return Utils.LoadData(url, new AndroidClientHandler());
            }
            catch (Exception e)
            {
                Log.Error(nameof(Bridge), e.ToString());
            }
            return string.Empty;
        }
    }
}
