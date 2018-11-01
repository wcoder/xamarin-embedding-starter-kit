//
// XViewController.cs
//
// Author:
//       Yauheni Pakala <evgeniy.pakalo@gmail.com>
//
// Copyright (c) 2018 Yauheni Pakala
//

using System;
using Foundation;
using UIKit;

namespace DotNet.IosLibrary
{
    [Register("XViewController")]
    public class XViewController : UIViewController
    {
        public XViewController() { }
        public XViewController (IntPtr handle) : base (handle) { }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            View.BackgroundColor = UIColor.White;

            var label = new UILabel();
            label.TranslatesAutoresizingMaskIntoConstraints = false;
            label.Text = "Hello from Xamarin.iOS";
            View.AddSubview(label);

            var button = UIButton.FromType(UIButtonType.System);
            button.TranslatesAutoresizingMaskIntoConstraints = false;
            button.SetTitle("Click me", UIControlState.Normal);
            button.TouchUpInside += (sender, e) =>
            {
                label.Text = "Clicked";
            };
            View.AddSubview(button);

            NSLayoutConstraint.ActivateConstraints(new[]
            {
                label.TopAnchor.ConstraintEqualTo(View.TopAnchor, 60f),
                label.CenterXAnchor.ConstraintEqualTo(View.CenterXAnchor),
                label.HeightAnchor.ConstraintEqualTo(30f),
                button.TopAnchor.ConstraintEqualTo(label.BottomAnchor),
                button.CenterXAnchor.ConstraintEqualTo(View.CenterXAnchor)
            });
        }
    }
}
