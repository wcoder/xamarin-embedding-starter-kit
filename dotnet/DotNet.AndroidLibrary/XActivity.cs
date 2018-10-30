//
// XActivity.cs
//
// Author:
//       Yauheni Pakala <evgeniy.pakalo@gmail.com>
//
// Copyright (c) 2018 Yauheni Pakala
//

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Widget;

namespace DotNet.AndroidLibrary
{
    [Activity(Label = "Xamarin Activity"),
     Register("dotnet.androidlibrary.XActivity")] // see limitations for this line
    public class XActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            SetContentView(Resource.Layout.activity_x);


            var clickMeButton = FindViewById<Button>(Resource.Id.btn_clickMe);
            clickMeButton.Click += (sender, e) =>
            {
                clickMeButton.Text = "Clicked!";
            };

            var returnResultButton = FindViewById<Button>(Resource.Id.btn_returnResult);
            returnResultButton.Click += (sender, e) =>
            {
                var intent = new Intent();
                intent.PutExtra("payload", clickMeButton.Text);
                SetResult(Result.Ok, intent);
                Finish();
            };
        }
    }
}
