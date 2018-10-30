package name.pakalo.evgeniy.simpleapp;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

// 1 - import .NET library
import dotnet_androidlibrary.dotnet.androidlibrary.Bridge;
import dotnet.androidlibrary.XActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView tv = findViewById(R.id.tv_hello);

        // 2 - create instance of .NET class
        Bridge bridge = new Bridge();

        // 3 - call method with parameter
        bridge.setTestStr("Test str from .NET");

        // 4 - get result
        String str = bridge.getTestStr();

        tv.setText(str);

        // 5 - more samples
        String v = bridge.getVersion();
        String fibRes = Integer.toString(bridge.fib(15));

        /////////////////////////////////////////////////////

        Button btnNav = findViewById(R.id.btn_navToXActivity);
        btnNav.setOnClickListener(new OnClickListener() {
            @Override
            // 6 - navigate to Xamarin Android Activity
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, XActivity.class));
            }
        });
    }
}
