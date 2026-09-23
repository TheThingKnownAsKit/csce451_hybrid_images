# Generating Hybrid Images

If you want to generate a different hybrid image pair, you need to do two things:
1. Change the filepath for the image being imported
2. Change the cutoff frequencies

## Changing the Filepath

In the chunk of code:

```matlab
image1 = im2single(imread('../data/cat.bmp'));
image2 = im2single(imread('../data/dog.bmp'));
```

`image1` will be treated as the LOW frequency image, so which one is assigned is important here. To replicate the results in the report, be sure to match the listed low frequency image here.

`image2` will always be treated as the HIGH frequency image, so all of the above applies.

The filepaths are listed assuming that you are running the code as a project, with directories for `code/` where `proj1.m` is and `data/` where the images are stored. It is assumed you will be running the code from the `code/` directory. If these assumptions do not hold, the filepath formatting will need to change.

## Changing the Cutoff Frequencies

The cutoff frequencies are declared in the below code snippet:

```matlab
cutoff_frequency_1 = 7;
cutoff_frequency_2 = 7;
```

`cutoff_frequency_1` is applied to `image1` and `cutoff_frequency_2` is applied to `image2`. All you have to do is change the number assigned and the rest of the code handles it.

If you are wanting to replicate images generated from the report, simply copy the numbers listed in the "Low Frequency: Cutoff Frequency" and "High Frequency: Cutoff Frequency" table columns.