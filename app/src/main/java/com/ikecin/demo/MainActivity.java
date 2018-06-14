package com.ikecin.demo;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Toast;


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        init();
        bindEvent();
    }

    private void init() {

    }

    private void bindEvent() {
        findViewById(R.id.button_test).setOnClickListener(v -> {
            Log.i("Test", "Test");
            Toast.makeText(this, "Test", Toast.LENGTH_SHORT).show();
        });
    }
}
