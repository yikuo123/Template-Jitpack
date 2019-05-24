package com.ikecin.demo;

import android.os.Bundle;
import android.widget.Toast;

import com.ikecin.jni.Demo;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        findViewById(R.id.ok).setOnClickListener(v -> {
            Toast.makeText(getApplicationContext(), Demo.methodA(), Toast.LENGTH_SHORT).show();
        });
    }

}
