package name.pakalo.evgeniy.simpleapp;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.Nullable;
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

    private TextView _tv;
    private Bridge _bridge;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        _tv = findViewById(R.id.tv_hello);

        // 2 - create instance of .NET class
        _bridge = new Bridge();

        // 3 - call method with parameter
        _bridge.setTestStr("Test str from .NET");

        // 4 - get result
        String str = _bridge.getTestStr();

        _tv.setText(str);

        // 5 - more samples
        String v = _bridge.getVersion();
        String fibRes = Integer.toString(_bridge.fib(15));

        /////////////////////////////////////////////////////

        Button btnNav = findViewById(R.id.btn_navToXActivity);
        btnNav.setOnClickListener(new OnClickListener() {
            @Override
            // 6 - navigate to Xamarin Android Activity
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, XActivity.class));
            }
        });

        Button btnNavRes = findViewById(R.id.btn_navToXActivityForResult);
        btnNavRes.setOnClickListener(new OnClickListener() {
            @Override
            // 7 - navigate to Xamarin Android Activity for result
            public void onClick(View v) {
                startActivityForResult(new Intent(MainActivity.this, XActivity.class), 0);
            }
        });

        Button btnLoadData = findViewById(R.id.btn_loadDataFromNetwork);
        btnLoadData.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                final String[] data = {""};
                Handler handler = new Handler() {
                    @Override
                    public void handleMessage(Message msg) {
                        _tv.setText(data[0]);
                    }
                };

                Runnable runnable = new Runnable() {
                    public void run() {
                        data[0] = _bridge.loadData("https://google.com");
                    }
                };
                Thread mythread = new Thread(runnable);
                mythread.start();
                //new LoadDataAsyncTask().execute();
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        if (data == null) { return; }
        if (requestCode != RESULT_OK) { return; }

        // 8 - get result from XActivity
        String payload = data.getStringExtra("payload");
        _tv.setText("Result: " + payload);
    }

    class LoadDataAsyncTask extends AsyncTask<String, Process, String> {
        @Override
        protected String doInBackground(String... strings) {
            return _bridge.loadData(strings[0]);
        }

        @Override
        protected void onPostExecute(String data) {
            _tv.setText(data);
        }
    }
}
