# ECE 6364 - Digital Image Processing

## Final Project

#### Description : Processing a short (3 second) video using wiener filter

The video's frames were saved using VLC with file pattern scene000##.png. Frame scene00061.png was picked to
sample the blur. A small bright dot at the 276-280 row and 101-105 collumn was picked in that frame. Code to
visually inspect the blur and generate the appropriate gaussian blur can be seen in the `sample_blur.m` file.

The `main.m` file contain the main code of the project, generating 3 videos:

1. `ECE6364_project_data_wiener.avi` show the video after weiner filter
2. `ECE6364_project_data_contrast.avi` show the video after contrast stretching
3. `ECE6364_project_data_wiener_contrast.avi` show the video after filter and contrast stretching

The wiener filter show a small improvement with visual inspection. Closer visual inspection show that 
the tesselation (pattern of small squares in the image) have dissappeared and features seem to be smoother
while becoming slightly more distinct.

The contrast stretched video showed that contrast stretching can show the veins slightly better, while
blending the farther features. The farther features, being dimly lit, became darker and harder to see. The
closer features become much brighter. The contrast stretched video gives the impression that some visual cues
were actually lost after contrast stretching. However comparing to the original video not much was gained or
lost. It does allow easier visual inspection at a glance however.

Contrast stretching after wiener filter produce predictable result. A combination of smoother, slightly
sharper features with the jarring visual effect of contrast stretching.

A better contrast stretching algorithm that limits the range of the new image might help with the jarring
visual effect.

Different blur mask for different regions of the image was not explored. Motion blur was also not explored.
