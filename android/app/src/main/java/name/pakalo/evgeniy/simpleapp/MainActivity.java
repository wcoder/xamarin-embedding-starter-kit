package name.pakalo.evgeniy.simpleapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

// 1 - import .NET library
import dotnet_androidlibrary.dotnet.androidlibrary.Bridge;

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
    }
}
