package com.ikecin.demo;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Toast;

import com.ikecin.sdk.jni.Demo;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        findViewById(R.id.ok).setOnClickListener(v -> {
            Toast.makeText(getApplicationContext(), Demo.text(), Toast.LENGTH_SHORT).show();
        });
    }

}
