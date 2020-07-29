package com.example.mygraph;
import android.graphics.Color;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Toast;

import com.jjoe64.graphview.*;
import com.jjoe64.graphview.helper.StaticLabelsFormatter;
import com.jjoe64.graphview.series.DataPoint;
import com.jjoe64.graphview.series.DataPointInterface;
import com.jjoe64.graphview.series.LineGraphSeries;
import com.jjoe64.graphview.series.OnDataPointTapListener;
import com.jjoe64.graphview.series.Series;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity{

    public void drawGraph(){
        final GraphView graphView = findViewById(R.id.graph);
        Viewport viewport=graphView.getViewport();
        boolean b=false;
        BufferedReader reader;

        String[] valXY;
        String Ylab;
        double Yval = 0.0;
        double Zval;

        try {
            String fname = "processedfile.csv";

            reader = new BufferedReader(new InputStreamReader(getAssets().open( fname)));
            reader.readLine();  //skip first line of file

            String mline;
            ArrayList<DataPoint> arrDataPoint = new ArrayList<>();
            final ArrayList<String> label = new ArrayList<>();
            while ((mline = reader.readLine()) != null) {
                valXY = mline.split(",");

                Ylab = valXY[0] + "/" + valXY[1];
                Yval = Yval + 1.0;
                Zval = Double.parseDouble(valXY[2]);
                DataPoint dp = new DataPoint(Yval, Zval);
                arrDataPoint.add(dp);
                label.add(Ylab);
                b=true;
                }

            DataPoint[] listDp = new DataPoint[arrDataPoint.size()];

            for (int i = 0; i < arrDataPoint.size(); i++) {
                listDp[i] = arrDataPoint.get(i);
                }

            String[] xlabel = GetStringArray(label);


            //if
            LineGraphSeries<DataPoint> series = new LineGraphSeries<>(listDp);

            if(b) {
                graphView.addSeries(series);
                series.setDrawBackground(true);
                series.setDrawDataPoints(false);
            }
            graphView.setTitle("Glucose Level");
            graphView.setTitleColor(Color.BLUE);
            graphView.setTitleTextSize(70f);
            viewport.setScalable(true);
            viewport.setScrollable(true);


            viewport.setXAxisBoundsManual(true);
            viewport.setYAxisBoundsManual(true);
            viewport.setMinX(0);
            viewport.setMinY(0);
            viewport.setMaxY(155);

            viewport.setScrollable(true); // enables horizontal scrolling
            viewport.setScrollableY(true); // enables vertical scrolling

            graphView.getGridLabelRenderer().setHorizontalAxisTitle("Time(DD.MM | HH.MM)");
            graphView.getGridLabelRenderer().setHorizontalAxisTitleTextSize(50f);
            graphView.getGridLabelRenderer().setHorizontalAxisTitleColor(Color.RED);
            StaticLabelsFormatter staticLabelsFormatter = new StaticLabelsFormatter(graphView);
            staticLabelsFormatter.setHorizontalLabels(xlabel);
            graphView.getGridLabelRenderer().setLabelFormatter(staticLabelsFormatter);
            graphView.getGridLabelRenderer().setNumHorizontalLabels(8);
            graphView.getGridLabelRenderer().setHorizontalLabelsAngle(90);
            graphView.getGridLabelRenderer().setHumanRounding(false);

            series.setOnDataPointTapListener(new OnDataPointTapListener() {

                Toast toast;
                @Override
                public void onTap(Series series, DataPointInterface dataPoint) {
                    toast = Toast.makeText(graphView.getContext(), "Glucose Reading: " + label.get((int) dataPoint.getX() - 1)+ " | " + dataPoint.getY(), Toast.LENGTH_SHORT);
                    toast.show();
                }
            });

        } catch (
                IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        drawGraph();
    }

    public static String[] GetStringArray(ArrayList<String> arr)
    {

        // declaration and initialise String Array
        String[] str = new String[arr.size()];

        // ArrayList to Array Conversion
        for (int j = 0; j < arr.size(); j++) {

            // Assign each value to String array
            str[j] = arr.get(j);
        }

        return str;
    }
}