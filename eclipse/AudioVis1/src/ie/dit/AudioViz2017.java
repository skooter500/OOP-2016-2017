// Hello from Tara!

package ie.dit;

// Another edit

import ddf.minim.AudioInput;
import ddf.minim.AudioSample;
import ddf.minim.Minim;
import ddf.minim.analysis.FFT;
import ddf.minim.analysis.WindowFunction;
import processing.core.PApplet;

public class AudioViz2017 extends PApplet{
	Minim minim;
	AudioInput audioInput;
	FFT fft;
	
	PitchSpeller pitchSpeller = new PitchSpeller();
	
	static final int FRAME_SIZE = 2048;
	static final int SAMPLE_RATE = 44100;
	
	public void setup()
	{
		minim = new Minim(this);
		audioInput = minim.getLineIn(Minim.MONO, FRAME_SIZE, SAMPLE_RATE, 16);
		//audioInput = minim.loadSample("luckyinlove.mp3", FRAME_SIZE);		
		fft = new FFT(FRAME_SIZE, SAMPLE_RATE);
		tf.loadTunes(2);
		tf.printTunes(tf.tunes);
		
		System.out.println(
				"Substring ed test:"
				+ EditDistance.substringEditDistance("abc", "xxxabdxxx")
				);
	}
	
	boolean lastPressed = false;
	
	String transcription = "";
	TuneFinder tf = new TuneFinder();
	Tune closestMatch = null;
	
	public void draw()
	{
		
		if (keyPressed && key == ' ' && ! lastPressed)
		{
			//audioInput.trigger();
			lastPressed = true;
		}
		else
		{
			lastPressed = false;
		}
		background(0);
		stroke(255);
		float mid = height / 2.0f;
		float average = 0;
		int count = 0;
		for(int i = 1 ; i < audioInput.bufferSize() ; i ++)
		{
			line(i, mid , i, mid + audioInput.left.get(i) * mid);
			average += Math.abs(audioInput.left.get(i));
			
			if (audioInput.left.get(i -1) > 0 && audioInput.left.get(i) <= 0)
			{
				count ++;
			}
			
		}
		average /= audioInput.bufferSize();
		
		float frequency = count * (SAMPLE_RATE / FRAME_SIZE);
		
		fill(255);
		
		
		fft.window(FFT.HAMMING);
		fft.forward(audioInput.left);
		stroke(0, 255, 255);
		int maxIndex = -1;
		float maxEnergy = Float.MIN_VALUE;
		for(int i = 0 ; i < fft.specSize(); i ++)
		{
			float energy = fft.getBand(i);
			if (energy > maxEnergy)
			{
				maxEnergy = energy;
				maxIndex = i;
			}
			line(i, height, i, height - (energy * 50));
			
		}
		
		float fftFreq = fft.indexToFreq(maxIndex);
		
		if (average > 0.001f)
		{
			text("Zero crossings Frequency: " + frequency, 10,10);
			text("FFT Frequency: " + fftFreq, 10,30);
			String zcSpell = pitchSpeller.spell(frequency);
			String fftSpell = pitchSpeller.spell(fftFreq);
			text("ZC Spelling: " + zcSpell, 10, 50);
			text("FFT Spelling: " + fftSpell, 10, 70);
			if (transcription.length() > 0)
			{
				String lastChar = transcription.substring(transcription.length() - 1);
				if (!lastChar.equals(fftSpell))
				{
					transcription += fftSpell;
				}
			}
			else
			{
				transcription += fftSpell;
			}				
		}
		if (transcription.length() > 60)
		{
			closestMatch = tf.findClosest(transcription);
			transcription = "";
		}			
		
		if (keyPressed && key == ' ')
		{
			transcription = "";
		}
		
		text("Transcription: " + transcription, 10, 90);
		text("Closest Match: " + closestMatch, 10, 110);
		
		
		noStroke();
		fill(0, 255, 0);
		float min = 100;		
		float target = min + average * mid * 2;
		circleRadius = lerp(circleRadius, target, 0.1f);
		//ellipse(mid, mid, circleRadius, circleRadius);
		
	}
	
	float circleRadius = 0;
	
	public void settings()
	{
		size(1024, 512);
	}

	public static void main(String[] args) {
	    String[] a = {"MAIN"};
        PApplet.runSketch( a, new AudioViz2017());
    
	}
}
